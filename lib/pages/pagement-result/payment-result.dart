import 'package:cdio_web/api/model/Payment.dart';
import 'package:cdio_web/api/services/Payment.dart';
import 'package:cdio_web/extensions/snack_bar.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentResult extends StatefulWidget {
  const PaymentResult({super.key});

  @override
  State<PaymentResult> createState() => _PaymentResultState();
}

class _PaymentResultState extends State<PaymentResult> {
  int? _paymentId;
  bool _isLoading = false;
  Payment? _payment;

  @override
  void initState() {
    _paymentId = int.tryParse(parameters['PaymentId'] ?? '');
    _fetch();
    super.initState();
  }

  _fetch() async {
    if (_paymentId == null) return;
    setState(() {
      _isLoading = true;
    });
    PaymentService.shared
        .get_pay(_paymentId ?? -1)
        .onError((error, stackTrace) {
      context.showSnackBar('Something is wrong', type: SnackBarType.error);
      return null;
    }).then((value) {
      _isLoading = false;
      setState(() {
        _payment = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(50),
          width: 500,
          height: 500,
          color: Colors.white,
          child: _isLoading ? _loading() : _paymentInfo(),
        ),
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _paymentInfo() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _payment != null && (_payment?.paymentStatus ?? 2) == 0 ?
          Icons.check_circle_outline_rounded :
          Icons.error_outline_rounded,
          size: 100,
          color: _payment != null && (_payment?.paymentStatus ?? 2) == 0 ?
          Colors.green :
          Colors.redAccent,
        ),
        const SizedBox(height: 20,),
        Text(
          _payment != null ? 'SUCCESSFUL!' : 'FAILURE!',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20,),
        if(_payment != null)
          Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Content: ${_payment?.paymentContent}'),
            Text('Price: ${priceFormat(_payment?.requiredAmount)}'),
            Text(
                'Date: ${DateFormat().format(DateTime.parse(_payment?.paymentDate ?? DateTime.now().toString()))}'),
          ],
        ),
        const SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.popUntil(context, (p){
                      return p.settings.name == '/';
                    });
                  },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Colors.redAccent
                ),
                  child: const Text(
                      'BACK TO HOME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
              ),
            ),
            if(_payment != null)
              SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    backgroundColor: Colors.green
                ),
                child: const Text(
                  'VIEW DETAILS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
