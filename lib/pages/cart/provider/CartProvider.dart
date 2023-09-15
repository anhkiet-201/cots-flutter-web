import 'package:cdio_web/api/model/Cart.dart';
import 'package:cdio_web/api/model/ErrorResponse.dart';
import 'package:cdio_web/api/services/CartService.dart';
import 'package:cdio_web/components/box/check-out-box.dart';
import 'package:cdio_web/extensions/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider with ChangeNotifier {
  CartProvider(this.context);
  final BuildContext context;
  final _service = CartService.shared;

  bool _isLoadingCart = false;

  bool get isLoadingCart => _isLoadingCart;

  set isLoadingCart(bool value) {
    _isLoadingCart = value;
    notifyListeners();
  }

  bool isLoaded = false;

  List<Cart> carts = [];

  Future<void> fetchCart() async {
    isLoadingCart = true;
    CheckOutBoxProvider.shared.isCalculating = true;
    await _service.get_carts().onError((error, stackTrace) {
      if(error is ErrorResponse) {
        context.showSnackBar('Fetch carts error!', type: SnackBarType.error);
      }
      return [];
    }).then((value) {
      carts = value;
      CheckOutBoxProvider.shared.add(value);
      isLoaded = true;
    }).whenComplete(() {
      isLoadingCart = false;
    });
  }

}