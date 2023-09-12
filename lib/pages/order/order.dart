import 'package:cdio_web/layout/Layout.dart';
import 'package:cdio_web/pages/order/order-item/OrderItem.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Your order',
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          constraints: const BoxConstraints(
            maxWidth: 1000,
            minWidth: 600
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for(int i = 0; i < 4; i++)
                OrderItem(i)
            ],
          ),
        )
      ],
    );
  }
}
