import 'package:cdio_web/api/model/Cart.dart';
import 'package:cdio_web/api/model/Product.dart';
import 'package:cdio_web/api/services/ProductService.dart';
import 'package:cdio_web/components/product/product-cart-list-item.dart';
import 'package:cdio_web/utils/local_storage_service.dart';
import 'package:flutter/material.dart';

class ProductCartItem extends StatefulWidget {
  const ProductCartItem(this.cart, {super.key});
  final Cart cart;

  @override
  State<ProductCartItem> createState() => _ProductCartItemState();
}

class _ProductCartItemState extends State<ProductCartItem> {

  Future<Product?> _fetch(BuildContext context) async {
    if(widget.cart.productId == null || widget.cart.quantity == null) return null;
    return await ProductService.shared.get_product(id: widget.cart.productId!)
        .onError((error, stackTrace) {
      //Navigator.maybeOf(context)?.pushReplacementNamed('not-found');
      debugPrintStack(label: error?.toString(), stackTrace: stackTrace);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetch(context),
      builder: (_, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const ProductCartListItemSkeleton();
        }
        return ProductCartListItem(snapshot.data, widget.cart);
      },
    );
  }
}
