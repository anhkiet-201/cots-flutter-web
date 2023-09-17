import 'package:cdio_web/api/model/Product.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice(this.product, {super.key});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(product?.originalPrice != null)
          Text(
            priceFormat(product?.originalPrice ?? 0),
            style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100),
          ),
        Text(
          priceFormat(product?.price ?? 0),
          style: const TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100),
        )
      ],
    );
  }
}
