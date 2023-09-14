import 'package:cdio_web/api/services/CartService.dart';
import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/extensions/snack_bar.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton(this.productId, {super.key});

  final int? productId;

  @override
  State<AddToCartButton> createState() => AddToCartButtonState();
}

class AddToCartButtonState extends State<AddToCartButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FillButton(
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: _isLoading
                ? const SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: SizedBox(
                  height: 12,
                  width: 12,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            )
                : const Text(
              'ADD TO CART',
            ),
          ),
        ),
        onTap: () {
          if(context.app.user == null) {
            context.showSnackBar('You must be login to add this product into your cart!', type: SnackBarType.error);
            return;
          }
          if(!_isLoading) {
            addToCart();
          }
        }
    );
  }

  Future<void> addToCart() async {
    if(widget.productId == null) {
      context.showSnackBar('Product error', type: SnackBarType.error);
    }
    setState(() {
      _isLoading = true;
    });
    CartService.shared.add_to_cart(widget.productId!)
        .onError((error, stackTrace) {
      if(error is FormatException) return true;
      context.showSnackBar('Add to cart failure!', type: SnackBarType.error);
      return false;
    }).then((value) {
      if(!value) return;
      context.showSnackBar('Added product to cart', type: SnackBarType.success);
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }
}