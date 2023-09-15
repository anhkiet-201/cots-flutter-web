import 'package:cdio_web/api/model/Cart.dart';
import 'package:cdio_web/api/model/ErrorResponse.dart';
import 'package:cdio_web/api/model/Product.dart';
import 'package:cdio_web/api/services/CartService.dart';
import 'package:cdio_web/components/box/check-out-box.dart';
import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/extensions/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class ProductCartListItem extends StatelessWidget {
  const ProductCartListItem(this.product, this.cart, {super.key});
  final Product? product;
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _Provider(context, product, cart),
      child: const _View(),
    );
  }
}


class _View extends StatefulWidget {
  const _View({super.key});

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<_Provider>();
    return Visibility(
      visible: !provider.isDeleted,
      child: provider.isLoading ? const ProductCartListItemSkeleton() : Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        height: 150,
        constraints: const BoxConstraints(
            maxWidth: 800,
            minWidth: 600
        ),
        child: Row(
          children: [
            BaseImage(
              provider.product?.listProductImage?.first.imageUrl ?? '',
              width: 120,
              height: 120,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${provider.product?.name}',
                            style: const TextStyle(
                                fontSize: 16
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(
                            'Option: option 1',
                            style: TextStyle(
                                fontSize: 12
                            ),
                          ),
                          ClickAble(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Iconsax.trash, size: 12,),
                                SpacerH(5),
                                Text(
                                  'Remove',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6)
                                  ),
                                )
                              ],
                            ),
                            onClick: () {
                              provider.remove();
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        SizedBox(
                          width: 100,
                          child: DropdownButtonFormField<String>(
                            value: '${provider.cart.quantity}',
                            items: [
                              for(int i = 1; i < 11; i++)
                                DropdownMenuItem(
                                  value: '$i',
                                  child: Text('$i'),
                                )
                            ],
                            onChanged: (value) {
                              provider.update(int.tryParse(value ?? '') ?? -1);
                            },
                            isExpanded: true,
                            elevation: 1,
                            borderRadius: BorderRadius.circular(10),
                            decoration:  const InputDecoration(
                                labelText: 'quantity',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.5
                                    )
                                )
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text('\$${provider.cart.price}')
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCartListItemSkeleton extends StatelessWidget {
  const ProductCartListItemSkeleton( {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      height: 150,
      constraints: const BoxConstraints(maxWidth: 800, minWidth: 600),
      child: Row(
        children: [
          const SizedBox(width: 120, height: 120, child: SkeletonAvatar()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonParagraph(),
                        const SizedBox(
                          height: 20,
                          width: 75,
                          child: SkeletonAvatar(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    children: [
                      SizedBox(
                        width: 100,
                        child: SkeletonAvatar(),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 20,
                        width: 75,
                        child: SkeletonAvatar(),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Provider with ChangeNotifier {
  final BuildContext context;
  final Product? product;
  Cart cart;
  _Provider(this.context, this.product, this.cart);

  final _service = CartService.shared;

  bool isDeleted = false;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> remove() async {
    isLoading = true;
    context.read<CheckOutBoxProvider>().isCalculating = true;
    await _service.remove(cart.id!)
    .onError((error, stackTrace) {
      if(error is ErrorResponse) {
        context.showSnackBar('Something is wrong!',type: SnackBarType.error);
      }
      return false;
    })
    .then((value) {
      isDeleted = true;
      context.read<CheckOutBoxProvider>().remove(cart.id!, context);
    }).whenComplete(() => isLoading = false);
  }

  Future<void> update(int quantity) async {
    isLoading = true;
    context.read<CheckOutBoxProvider>().isCalculating = true;
    await _service.update(cart.id!, quantity)
        .onError((error, stackTrace) {
          context.showSnackBar('Something is wrong!',type: SnackBarType.error);
      context.read<CheckOutBoxProvider>().isCalculating = false;
      return false;
    }).then((value) {
      if(!value) return;
      final temp = cart;
      temp.quantity = quantity;
      cart = temp;
      context.read<CheckOutBoxProvider>().updateOne(cart.id!, quantity);
    }).whenComplete(() {
      isLoading = false;
    });
  }

}
