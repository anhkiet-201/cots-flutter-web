import 'package:cdio_web/api/model/Cart.dart';
import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/pages/cart/provider/CartProvider.dart';
import 'package:cdio_web/utils/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class CheckoutBox extends StatefulWidget {
  const CheckoutBox({super.key});

  @override
  State<CheckoutBox> createState() => _CheckoutBoxState();
}

class _CheckoutBoxState extends State<CheckoutBox> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CheckOutBoxProvider>(context);
    return Visibility(
      visible: !provider.isEmpty,
      child: provider.isCalculating ? _skeleton() : Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        constraints:
        const BoxConstraints(maxWidth: 600, minWidth: 400),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Subtotal',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$${provider.subTotal}',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  'Shipping cost',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$${provider.shipping}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const Spacer(),
                Text(
                  '\$${provider.total}',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
            SpacerV(25),
            SizedBox(
                width: double.infinity,
                child: FillButton(
                    child: const Text('CHECKOUT'),
                    onTap: () {
                      context.push('/check-out');
                    }))
          ],
        ),
      ),
    );
  }

  Widget _skeleton() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      constraints:
      const BoxConstraints(maxWidth: 600, minWidth: 400),
      child: Column(
        children: [
          SkeletonParagraph(),
          SpacerV(25),
          const SizedBox(
              width: double.infinity,
              child: SkeletonAvatar()
          )
        ],
      ),
    );
  }
}


class CheckOutBoxProvider with ChangeNotifier {
  static final shared = CheckOutBoxProvider();

  bool _isCalculating = false;

  bool get isCalculating => _isCalculating;

  set isCalculating (bool value) {
    _isCalculating = value;
    notifyListeners();
  }

  bool hasCart = false;
  double subTotal = 0;
  double shipping = 1.3;
  double total = 0;

  List<Cart> _cart = [];
  List<Cart> get cart => _cart;

  bool get isEmpty => _cart.isEmpty;

  add(List<Cart> cart) {
    if(cart.isEmpty) {
      hasCart = false;
      return;
    }
    _cart = cart;
    hasCart = true;
    _update();
  }

  _update() {
    subTotal = 0;
    for (var element in _cart) {
      subTotal += (element.price ?? 0) * (element.quantity ?? 1);
    }
    subTotal = subTotal.roundToDouble();
    total = subTotal + shipping;
    isCalculating = false;
  }

  updateOne(int id, int quantity) {
    _cart = _cart.map((e) {
      if(e.id == id) {
        final temp = e;
        temp.quantity = quantity;
        return temp;
      }
      return e;
    }).toList();
    _update();
  }

  remove(int id, BuildContext context) {
    _cart.removeWhere((e) => e.id == id);
    if(_cart.isEmpty) {
      context.read<CartProvider>().notifyListeners();
    }
    _update();
  }

}
