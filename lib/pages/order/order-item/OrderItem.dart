import 'package:cdio_web/api/model/OrderHistory.dart';
import 'package:cdio_web/api/services/OrderService.dart';
import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';

class OrderItem extends StatefulWidget {
  const OrderItem(this.order, {super.key});

  final OrderHistory order;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  final List<OrderHistoryDetail> _details = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      onExpansionChanged: (isExpanded) {
        if (isExpanded) _fetch();
      },
      title: Text(
        '#${order.orderId}',
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Status: ${order.orderStatus}',
            style: const TextStyle(fontSize: 16),
          ),
          SpacerV(),
          Row(
            children: [
              Text(
                DateFormat().add_MMMMEEEEd().format(DateTime.parse(
                    order.paymentDate ?? DateTime.now().toString())),
                style: const TextStyle(fontSize: 12),
              ),
              SpacerH(),
              if (_details.isNotEmpty)
                Text(
                  '${_details.length} items',
                  style: const TextStyle(fontSize: 12),
                )
            ],
          )
        ],
      ),
      children: [
        _line(),
        SpacerV(50),
        _itemInfo(),
        SpacerV(50),
        _line(),
        SpacerV(50),
        _info(order),
        SpacerV(50),
        _line(),
        SpacerV(50),
        const Text(
          'Need help?',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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

  Widget _itemInfo() {
    return _isLoading
        ? _skeleton()
        : Column(
            children: [..._details.map((e) => _item(e)).toList()],
          );
  }

  _fetch() async {
    if (_isLoading || _details.isNotEmpty) return;
    setState(() {
      _isLoading = true;
    });
    OrderService.shared
        .get_history_order_detail(widget.order.orderId!)
        .onError((error, stackTrace) {
      return [];
    }).then((value) {
      _details.addAll(value);
      setState(() {
        _isLoading = false;
      });
    });
  }

  Widget _skeleton() {
    return SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 75,
            height: 25,
            child: SkeletonAvatar(),
          ),
          SkeletonParagraph(
            style: const SkeletonParagraphStyle(lines: 1),
          ),
          Row(
            children: [
              Expanded(
                child: SkeletonParagraph(
                  style: const SkeletonParagraphStyle(lines: 2),
                ),
              ),
              const Spacer()
            ],
          )
        ],
      ),
    );
  }

  Container _line() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey.withOpacity(0.5),
    );
  }

  Widget _item(OrderHistoryDetail detail) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      height: 150,
      child: Row(
        children: [
          BaseImage(
            detail.thumbnail ?? '',
            width: 120,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${detail.productName}',
                          style: const TextStyle(fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Text(
                        //   '${detail.}',
                        //   style: TextStyle(
                        //       fontSize: 12
                        //   ),
                        // ),
                        Text(
                          'Quantity: ${detail.productQuantity}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Text(
                    priceFormat(detail.subtotal),
                    style: const TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _info(OrderHistory orderHistory) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoTitle('Delivery Info'),
              SpacerV(10),
              Text(
                '${orderHistory.shipName}',
                style: const TextStyle(fontSize: 14),
              ),
              SpacerV(5),
              Text(
                '${orderHistory.shipPhoneNumber}',
                style: const TextStyle(fontSize: 14),
              ),
              // SpacerV(5),
              // const Text(
              //   '0839874646',
              //   style: TextStyle(
              //       fontSize: 14
              //   ),
              // ),
              SpacerV(20),
              const Text(
                'Address',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SpacerV(10),
              Text(
                '${orderHistory.shipAddress}',
                style: const TextStyle(fontSize: 14),
              ),
              // SpacerV(5),
              // const Text(
              //   'District - Thanh Khe Tay',
              //   style: TextStyle(
              //       fontSize: 14
              //   ),
              // ),
              // SpacerV(5),
              // const Text(
              //   'Ward - Thanh Khe',
              //   style: TextStyle(
              //       fontSize: 14
              //   ),
              // ),
              // SpacerV(5),
              // const Text(
              //   'Street - 110 Nguyen Thi Thap',
              //   style: TextStyle(
              //       fontSize: 14
              //   ),
              // ),
              SpacerV(20),
              const Text(
                'Payment method',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SpacerV(10),
              Text(
                'Payment via ${orderHistory.methodPayment}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoTitle('Order Summary'),
              // SpacerV(20),
              // Row(
              //   children: [
              //     Text(
              //       '${orderHistory.}',
              //       style: TextStyle(
              //           fontSize: 15,
              //           fontWeight: FontWeight.w500
              //       ),
              //     ),
              //     Spacer(),
              //     Text(
              //       '\$545.34',
              //       style: TextStyle(
              //           fontSize: 15,
              //           fontWeight: FontWeight.w500
              //       ),
              //     ),
              //   ],
              // ),
              // SpacerV(10),
              // const Row(
              //   children: [
              //     Text(
              //       'Shipping',
              //       style: TextStyle(
              //           fontSize: 14
              //       ),
              //     ),
              //     Spacer(),
              //     Text(
              //       '\$3.09',
              //       style: TextStyle(
              //           fontSize: 14
              //       ),
              //     ),
              //   ],
              // ),
              // SpacerV(20),
              // _line(),
              // SpacerV(20),
              Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    priceFormat(orderHistory.totalPrice),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
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
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}
