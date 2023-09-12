import 'dart:math';

import 'package:cdio_web/api/model/Product.dart';
import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:cdio_web/components/space.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem(this.product, {super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      height: 150,
      width: MediaQuery.of(context).size.width * 0.8,
      constraints: const BoxConstraints(
        maxWidth: 800,
        minWidth: 600
      ),
      child: Row(
        children: [
          BaseImage(
            product.listProductImage?.first.imageUrl ?? '',
            width: 120,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(
                         width: 480,
                         child: Text(
                            '${product.name}',
                          style: const TextStyle(
                            fontSize: 16
                          ),
                           maxLines: 2,
                      ),
                       ),
                      const Text(
                          'Option: option 1',
                        style: TextStyle(
                          fontSize: 12
                        ),
                      ),
                       const Spacer(),
                      ClickAble(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                             const Icon(Iconsax.trash, size: 12,),
                            SpacerH(size: 5),
                            Text(
                              'Remove',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.6)
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                   const Spacer(),
                  Column(
                    children: [
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField<String>(
                          value: '2',
                            items: [
                              for(int i = 1; i < 11; i++)
                                DropdownMenuItem(
                                  value: '$i',
                                  child: Text('$i'),
                                )
                            ],
                            onChanged: (value) {

                            },
                          isExpanded: true,
                          elevation: 1,
                          borderRadius: BorderRadius.circular(10),
                          decoration:  const InputDecoration(
                            labelText: 'quantity',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 0.5
                              )
                            )
                          ),
                        ),
                      ),
                       const Spacer(),
                       Text('\$${product.price}')
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
