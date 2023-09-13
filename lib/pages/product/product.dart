import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/image/image_album.dart';
import 'package:cdio_web/components/product/product-card.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/layout/Layout.dart';
import 'package:cdio_web/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var isLoading = false;

  double get width => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    final product = petCloth.first;
    return Layout(
      children: [
        Wrap(
          runSpacing: 20,
          spacing: 20,
          children: [
            ImageAlbum(
              isLoading: isLoading,
                product.listProductImage?.map((e) => e.imageUrl ?? '').toList() ?? []
            ),
            SizedBox(
              width: 720,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: isLoading ? SkeletonParagraph() : SelectableText(
                        '${product.name}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                      ),
                      maxLines: 2,
                    ),
                  ),
                  isLoading ? SizedBox(
                    width: 150,
                    child: SkeletonParagraph(
                      style: const SkeletonParagraphStyle(
                        lines: 1,
                      ),
                    ),
                  ) :SelectableText(
                    '\$${product.price ?? 0}',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                    ),
                  ),
                  SpacerV(),
                  isLoading ? SkeletonParagraph(
                    style: const SkeletonParagraphStyle(
                      lines: 5
                    ),
                  ) :Container(
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
                  isLoading ? const SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: double.infinity
                    ),
                  ) : FillButton(child: const SizedBox(
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
}


