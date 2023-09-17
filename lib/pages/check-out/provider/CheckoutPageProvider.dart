import 'package:cdio_web/api/model/PaymentDestination.dart';
import 'package:cdio_web/api/services/OrderService.dart';
import 'package:cdio_web/api/services/Payment.dart';
import 'package:cdio_web/components/box/check-out-box.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/extensions/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutPageProvider with ChangeNotifier {
  final BuildContext context;
  CheckoutPageProvider(this.context);
  var formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  PaymentDestination? paymentSelected;
  final _orderService = OrderService.shared;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> create_order() async {
    if(!(formKey.currentState?.validate() ?? false)) {
      context.showSnackBar('Info error!', type: SnackBarType.error);
      return;
    }
    if(paymentSelected == null) {
      context.showSnackBar('You must choose payment method to continue!', type: SnackBarType.error);
      return;
    }
    isLoading = true;
    final order = await _orderService.create_order(
        name: name.text,
        address: address.text,
        email: email.text,
        phone: phone.text,
        list: CheckOutBoxProvider.shared.cart.map((e) => OrderRequest(e.productId!, e.quantity!)).toList()
    );
    if(order == null) {
      context.showSnackBar('Create order error!', type: SnackBarType.error);
      isLoading = false;
      return;
    }
    PaymentService.shared.create_pay(
        orderId: order.id!,
        paymentDestinationId: paymentSelected!.id!,
        requiredAmount: order.totalPrice!
    ).onError((error, stackTrace) {
      context.showSnackBar('Something is wrong!', type: SnackBarType.error);
      return null;
    }).then((value) {
      if(value == null) return;
      launchUrl(Uri.parse(value.paymentUrl!));
    }).whenComplete(() => isLoading = false);
  }
}