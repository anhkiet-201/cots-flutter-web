import 'package:cdio_web/components/title/TitleExpansionTile.dart';
import 'package:flutter/material.dart';

class PaymentSelection extends StatefulWidget {
  const PaymentSelection({super.key});

  @override
  State<PaymentSelection> createState() => _PaymentSelectionState();
}

class _PaymentSelectionState extends State<PaymentSelection> {

  PaymentMethod? _payment = PaymentMethod.pod;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(
        maxWidth: 800,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ExpansionTile(
            title: TitleExpansionTile(number: 2, label: 'Payment'),
            children: [
              _paymentItem(PaymentMethod.pod),
              _paymentItem(PaymentMethod.vn_pay),
              _paymentItem(PaymentMethod.momo),
              _paymentItem(PaymentMethod.zalo_pay),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paymentItem(PaymentMethod method) {
    return ListTile(
      leading: Radio(value: method, groupValue: _payment, onChanged: (value) {
        setState(() {
          _payment = value;
        });
      },
        focusColor: Colors.black,
      ),
      title: Text(
          method.title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text(
        method.subTitle,
        style: const TextStyle(
          fontSize: 12
        ),
      ),
    );
  }
}

enum PaymentMethod {
  pod('Payment on delivery', 'You will pay upon receipt'),
  vn_pay('VnPay', 'Payment via VnPay'),
  momo('Momo', 'Payment via Momo'),
  zalo_pay('ZaloPay', 'Payment via ZaloPay');

  const PaymentMethod(this.title, this.subTitle);
  final String title;
  final String subTitle;
}
