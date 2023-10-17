import 'package:cdio_web/api/model/Product.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice(this.product, {super.key, this.size = 25});
  final Product? product;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(product?.originalPrice != null)
          Text(
            priceFormat(product?.originalPrice ?? 0),
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: size - 7,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100),
          ),
        Text(
          priceFormat(product?.price ?? 0),
          style: TextStyle(
              fontSize: size,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100),
        )
      ],
    );
  }
}
