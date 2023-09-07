import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

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
                  'https://img.fruugo.com/product/9/78/204181789_max.jpg',
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
                    const Text(
                      'T-Shirt',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    ),
                    SpacerV(size: 5),
                    Row(
                      children: [
                        RatingBarIndicator(
                          itemSize: 18,
                          rating: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.amber,
                            );
                          },
                        ),
                        SpacerH(size: 5),
                        const Text(
                          '5.0',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    SpacerV(size: 5),
                    const Text(
                      '\$18,00',
                      style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w100),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Expanded(child: Button(child: const Text('ADD TO CART'), onTap: (){})),
                  SpacerH(size: 10),
                  Button(child: const Icon(Iconsax.heart), onTap: (){})
                ],
              ),
            ),
            SpacerV(),
          ],
        ),
      ),
      onClick: () {
        context.push('/product');
      },
    );
  }
}
