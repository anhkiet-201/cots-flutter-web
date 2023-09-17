import 'package:cdio_web/api/model/PaymentDestination.dart';
import 'package:cdio_web/api/services/PaymentDestinationService.dart';
import 'package:cdio_web/components/title/TitleExpansionTile.dart';
import 'package:cdio_web/pages/check-out/provider/CheckoutPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentSelection extends StatefulWidget {
  const PaymentSelection({super.key});

  @override
  State<PaymentSelection> createState() => _PaymentSelectionState();
}

class _PaymentSelectionState extends State<PaymentSelection> {
  PaymentDestination? _payment;
  late Future<List<PaymentDestination>> _payments;


  @override
  void initState() {
    _payments = _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _payments,
      builder: (_, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(
            maxWidth: 800,
          ),
          color: Colors.white,
          child: ExpansionTile(
            title: TitleExpansionTile(number: 2, label: 'Payment'),
            children: snapshot.data?.map((e) => _paymentItem(e)).toList() ?? [],
          ),
        );
      },
    );
  }

  Widget _paymentItem(PaymentDestination method) {
    return ListTile(
      leading: Radio(value: method, groupValue: _payment, onChanged: (value) {
        setState(() {
          _payment = value;
          context.read<CheckoutPageProvider>().paymentSelected = value;
        });
      },
        focusColor: Colors.black,
      ),
      title: Text(
          method.desShortName ?? '',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text(
        method.desName ?? '',
        style: const TextStyle(
          fontSize: 12
        ),
      ),
    );
  }

  Future<List<PaymentDestination>> _fetch() async {
    return PaymentDestinationService.shared.get_all();
  }
}

