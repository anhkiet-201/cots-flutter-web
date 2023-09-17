import 'package:cdio_web/api/model/Product.dart' as ProductModel;
import 'package:cdio_web/api/services/ProductService.dart';
import 'package:cdio_web/components/button/add-to-cart-button.dart';
import 'package:cdio_web/components/image/image_album.dart';
import 'package:cdio_web/components/product/product-card.dart';
import 'package:cdio_web/components/product/product-price.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/layout/Layout.dart';
import 'package:cdio_web/utils/data.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var isLoading = true;
  ProductModel.Product? _product;

  @override
  Widget build(BuildContext context) {
    if(_product == null) {
      _fetch();
    }
    return Layout(
      children: [
        Wrap(
          runSpacing: 20,
          spacing: 20,
          children: [
            ImageAlbum(
              isLoading: isLoading,
                _product?.listProductImage?.map((e) => e.imageUrl ?? '').toList() ?? []
            ),
            SizedBox(
              width: 720,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: isLoading ? SkeletonParagraph() : SelectableText(
                        '${_product?.name}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                      ),
                      maxLines: 2,
                    ),
                  ),
                  isLoading ? SizedBox(
                    width: 150,
                    child: SkeletonParagraph(
                      style: const SkeletonParagraphStyle(
                        lines: 1,
                      ),
                    ),
                  ) : ProductPrice(_product),
                  SpacerV(),
                  isLoading ? SkeletonParagraph(
                    style: const SkeletonParagraphStyle(
                      lines: 5
                    ),
                  ) :Container(
                    constraints: const BoxConstraints(
                      minHeight: 100
                    ),
                    child: SelectableText(
                      '${_product?.description}',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                  SpacerV(50),
                  isLoading ? const SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: double.infinity
                    ),
                  ) : AddToCartButton(_product?.id),
                  SpacerV(),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         color: Colors.red,
                  //         constraints: const BoxConstraints(
                  //           minHeight: 100
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //         color: Colors.black,
                  //         constraints: const BoxConstraints(
                  //             minHeight: 100
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              ),
            )
          ],
        ),
        SpacerV(100),
        const Text(
          'Related products'
        ),
        const SizedBox(
          width: 500,
          child: Text(
            'You might also want to check out these products.',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SpacerV(100),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 1360
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Divider(height: 1,color: Colors.grey, indent: 50, endIndent: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: petCloth.map((e) => ProductCard(e)).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

extension on _ProductState {
  Future<void> _fetch() async {
    final id = int.tryParse(parameters['id'] ?? '') ?? 0;
    ProductService.shared.get_product(id: id)
        .onError((error, stackTrace) {
      Navigator.maybeOf(context)?.pushReplacementNamed('not-found');
    })
        .then((value) {
      if(value == null) return;
      _product = value;
      setState(() {
        isLoading = false;
      });
    });
  }
}
