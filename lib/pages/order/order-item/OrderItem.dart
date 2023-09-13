import 'dart:math';

import 'package:cdio_web/api/model/Product.dart';
import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      title: Text(
        '#$index',
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              '01HCBSPPDPYB6YSW30872C621J',
            style: TextStyle(
              fontSize: 16
            ),
          ),
          SpacerV(),
          Row(
            children: [
              const Text(
                  'Tue Oct 10 2023',
                style: TextStyle(
                  fontSize: 12
                ),
              ),
              SpacerH(),
              const Text(
                  '4 items',
                style: TextStyle(
                    fontSize: 12
                ),
              )
            ],
          )
        ],
      ),
      children: [
        _line(),
        SpacerV(50),
        ...petCloth.map((e) => _item(e)).toList(),
        SpacerV(50),
        _line(),
        SpacerV(50),
        _info(),
        SpacerV(50),
        _line(),
        SpacerV(50),
        const Text(
          'Need help?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
        ),
        SpacerV(10),
        const Text(
          'Contact us',
          style: TextStyle(
              fontSize: 14,
          ),
        ),
      ],
    );
  }

  Container _line() {
    return Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey.withOpacity(0.5),
      );
  }

  Widget _item(Product product) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      height: 150,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Text(
                        'Option: option 1',
                        style: TextStyle(
                            fontSize: 12
                        ),
                      ),
                      const Text(
                        'Quantity: 2',
                        style: TextStyle(
                            fontSize: 12
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 14
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _info() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoTitle('Delivery'),
              SpacerV(10),
              const Text(
                'Anh Kiet',
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              SpacerV(5),
              const Text(
                'Igg.anhkiet1@gmail.com',
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              SpacerV(5),
              const Text(
                '0839874646',
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              SpacerV(20),
              const Text(
                  'Address',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
              ),
              SpacerV(10),
              const Text(
                'Province - Da Nang',
                style: TextStyle(
                  fontSize: 14
                ),
              ),
              SpacerV(5),
              const Text(
                'District - Thanh Khe Tay',
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              SpacerV(5),
              const Text(
                'Ward - Thanh Khe',
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              SpacerV(5),
              const Text(
                'Street - 110 Nguyen Thi Thap',
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              SpacerV(20),
              const Text(
                'Delivery method',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              ),
              SpacerV(10),
              const Text(
                'Payment via Momo',
                style: TextStyle(
                    fontSize: 14
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoTitle('Order Summary'),
              SpacerV(20),
              const Row(
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$545.34',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
              SpacerV(10),
              const Row(
                children: [
                  Text(
                    'Shipping',
                    style: TextStyle(
                        fontSize: 14
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$3.09',
                    style: TextStyle(
                        fontSize: 14
                    ),
                  ),
                ],
              ),
              SpacerV(20),
              _line(),
              SpacerV(20),
              const Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$542.34',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _infoTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
