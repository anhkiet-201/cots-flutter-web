import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:cdio_web/components/image/image_album.dart';
import 'package:cdio_web/layout/Layout.dart';
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
    print(parameters);
    return Layout(
      children: [
        const SizedBox(height: 100,),
        Wrap(
          children: [
            const ImageAlbum(
                [
                  'https://i.pinimg.com/736x/ec/2d/01/ec2d0137634e8c4f599644ef7fe7303b.jpg',
                  'https://i.pinimg.com/originals/6e/5f/41/6e5f41cfc54de2e38c519591fc73a144.jpg',
                  'https://i.pinimg.com/736x/a5/31/63/a53163e5b3c188d56633488c61b34141.jpg',
                  'https://i.pinimg.com/originals/be/87/17/be87171cfe1012bc5f5ccbc66ad19d33.jpg',
                  'https://i.pinimg.com/736x/76/ba/58/76ba58ed438ef908512218fd4da629d4.jpg'
                ]
            ),
            Container(
              padding: const EdgeInsets.all(50),
              width: 720,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                    child: SelectableText(
                        'Product name',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600
                      ),
                      maxLines: 2,
                    ),
                  ),
                  const SelectableText(
                    '\$100.0',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      color: Colors.redAccent
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 100
                    ),
                    child: const SelectableText(
                      'A product description provides consumers with practical information about a product’s benefits, measurements and specifications, composition, use cases and more. Detailed product descriptions are a critical part of selling online. Product descriptions can be found on product pages, typically below a product’s name and price. They’re usually no longer than 300 words.',
                      style: TextStyle(

                      ),
                    ),
                  ),
                  const Divider(color: Colors.black, thickness: 0.5,),
                  FillButton(child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'ADD TO CART',
                      ),
                    ),
                  ), onTap: (){}),
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
        )
      ],
    );
  }
}


