import 'dart:math';

import 'package:cdio_web/api/model/Product.dart';
import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/icons/icons-define.dart';
import 'package:cdio_web/components/icons/icons.dart';
import 'package:cdio_web/components/product/product-card.dart';
import 'package:cdio_web/components/product/product-horizontal-list.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/layout/Layout.dart';
import 'package:cdio_web/utils/data.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      enableExpanded: true,
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1360
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconNet(IconsType.salad, size: const Size(50, 50)),
                    const Text('Accessories')
                  ],
                ),
                Column(
                  children: [
                    IconNet(IconsType.bird, size: const Size(50, 50)),
                    const Text('Bird')
                  ],
                ),
                Column(
                  children: [
                    IconNet(IconsType.dog, size: const Size(50, 50)),
                    const Text('Dog')
                  ],
                ),
                Column(
                  children: [
                    IconNet(IconsType.cat, size: const Size(50, 50)),
                    const Text('Cat')
                  ],
                ),
              ],
            ),
          ),
        ),
        SpacerV(100),
        //const ProductHorizontalList(type: ProductHorizontalListType.cloth,),
        // _item(title: 'Pet cloths', items: petCloth),
        SpacerV(100),
        //const ProductHorizontalList(type: ProductHorizontalListType.food,),
        SpacerV(100),
        //const ProductHorizontalList(type: ProductHorizontalListType.cat,),
        // _item(title: 'Pet foodies', items: petFood),
        SpacerV(100),
        _midBanner(),
        SpacerV(100),
        const ProductHorizontalList(type: ProductHorizontalListType.dog,),
        // _item(title: 'Pet foodies', items: petCloth),
      ],
    );
  }

  Center _item({
    required String title,
    required List<Product> items
}) {
    return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
              maxWidth: 1360
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(title),
              // const Divider(height: 1,color: Colors.grey, indent: 50, endIndent: 50,),
              SpacerV(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: items.map((e) => ProductCard(e)).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}

extension on HomePage {
  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
          const Spacer(),
          Button(
              child: Row(
                children: [
                  const Text('SHOP ALL'),
                  SpacerH(5),
                  const Icon(Icons.arrow_right_alt_rounded)
                ],
              ),
              onTap: (){}
          )
        ],
      ),
    );
  }

  Widget _midBanner() {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Image.network(
        'https://i.pinimg.com/originals/44/38/42/443842e79f65f2077a39f6d9d448fd1a.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
