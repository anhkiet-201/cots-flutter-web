import 'package:cdio_web/api/model/Product.dart';
import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/components/product/product-card.dart';
import 'package:cdio_web/components/product/product-card.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:flutter/material.dart';

class ProductCardSkeleton extends StatelessWidget {
  const ProductCardSkeleton(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClickAble(
      child: Container(
        height: 500,
        width: 300,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.listProductImage?.first.imageUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SpacerV(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? '',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SpacerV(5),
                    Text(
                      '\$${product.price ?? 0}',
                      style: const TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w100),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                    width: double.infinity,
                    child: Button(
                        child: const Text('ADD TO CART'), onTap: () {}))),
            SpacerV(),
          ],
        ),
      ),
      onClick: () {
        context.push('/product',{'id': 4});
      },
    );
  }
}
