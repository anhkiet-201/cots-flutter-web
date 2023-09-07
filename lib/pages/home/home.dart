import 'dart:math';

import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/icons/icons-define.dart';
import 'package:cdio_web/components/icons/icons.dart';
import 'package:cdio_web/components/product/product-card.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/layout/Layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      enableExpanded: true,
      children: [
        SpacerV(size: 100),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1360
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                SpacerV(size: 100),
                _title('Pet clothing'),
                // const Divider(height: 1,color: Colors.grey, indent: 50, endIndent: 50,),
                SpacerV(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SpacerV(size: 100),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 1360
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title('Pet foodies'),
                // const Divider(height: 1,color: Colors.grey, indent: 50, endIndent: 50,),
                SpacerV(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SpacerV(size: 100),
        _midBanner(),
        SpacerV(size: 100),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 1360
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title('Best selling'),
                // const Divider(height: 1,color: Colors.grey, indent: 50, endIndent: 50,),
                SpacerV(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                      ],
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
                  SpacerH(size: 5),
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
