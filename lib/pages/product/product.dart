import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:cdio_web/components/image/image_album.dart';
import 'package:cdio_web/components/product/product-card.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/layout/Layout.dart';
import 'package:cdio_web/utils/data.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    final product = petCloth.first;
    return Layout(
      children: [
        Wrap(
          children: [
            ImageAlbum(
                product.listProductImage?.map((e) => e.imageUrl ?? '').toList() ?? []
            ),
            Container(
              padding: const EdgeInsets.all(50),
              width: 720,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: SelectableText(
                        '${product.name}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                      ),
                      maxLines: 2,
                    ),
                  ),
                  SelectableText(
                    '\$${product.price ?? 0}',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                    ),
                  ),
                  SpacerV(),
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 100
                    ),
                    child: SelectableText(
                      '${product.description}',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                  SpacerV(50),
                  FillButton(child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'ADD TO CART',
                      ),
                    ),
                  ), onTap: (){}),
                  SpacerV(),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         color: Colors.red,
                  //         constraints: const BoxConstraints(
                  //           minHeight: 100
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //         color: Colors.black,
                  //         constraints: const BoxConstraints(
                  //             minHeight: 100
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              ),
            )
          ],
        ),
        SpacerV(100),
        const Text(
          'Related products'
        ),
        const SizedBox(
          width: 500,
          child: Text(
            'You might also want to check out these products.',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SpacerV(100),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 1360
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Divider(height: 1,color: Colors.grey, indent: 50, endIndent: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: petCloth.map((e) => ProductCard(e)).toList(),
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
}


