import 'package:cdio_web/api/model/OrderHistory.dart';
import 'package:cdio_web/api/services/OrderService.dart';
import 'package:cdio_web/extensions/snack_bar.dart';
import 'package:cdio_web/layout/Layout.dart';
import 'package:cdio_web/pages/order/order-item/OrderItem.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final List<OrderHistory> _order = [];
  bool _isLoading = false;

  @override
  void initState() {
    _fetch();
    super.initState();
  }

  _fetch() async {
    setState(() {
      _isLoading = true;
    });
    OrderService.shared.get_history_order().onError((error, stackTrace) {
      context.showSnackBar('Something is error!', type: SnackBarType.error);
      return [];
    }).then((value) {
      _isLoading = false;
      setState(() {
        _order.addAll(value.reversed);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Your order',
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          constraints: const BoxConstraints(maxWidth: 1000, minWidth: 600),
          child: _isLoading
              ? _loading()
              : _order.isEmpty
                  ? _empty()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [for (int i = 0; i < _order.length; i++) OrderItem(_order[i])],
                    ),
        )
      ],
    );
  }

  Widget _loading() {
    return const SizedBox(
      height: 250,
      child: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _empty() {
    return const SizedBox(
      height: 250,
      child: Center(
        child: Text(
          'Empty',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
