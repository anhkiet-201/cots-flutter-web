import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/components/text_field/BaseTextField.dart';
import 'package:cdio_web/components/title/TitleExpansionTile.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/pages/check-out/provider/CheckoutPageProvider.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingInfo extends StatefulWidget {
  const ShippingInfo({super.key});

  @override
  State<ShippingInfo> createState() => _ShippingInfoState();
}

class _ShippingInfoState extends State<ShippingInfo> {
  late CheckoutPageProvider _provider;


  @override
  void initState() {
    super.initState();
    _provider = context.read<CheckoutPageProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _provider.formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints(
          maxWidth: 800,
        ),
        color: Colors.white,
        child: ExpansionTile(
          initiallyExpanded: true,
          title: TitleExpansionTile(number: 1, label: 'Shipping address'),
          children: [
            SpacerV(30),
            BaseTextField(
              controller: _provider.email..text = context.app.user?.email ?? '',
                label: 'Email',
              validator: (value) {
                  if(validateEmail(value ?? '')) return null;
                  return 'Please enter a correct email!';
              }
            ),
            SpacerV(10),
            BaseTextField(
              controller: _provider.name,
                label: 'Name',
                validator: (value) {
                  if(value?.isEmpty ?? true) return 'Please Don\'t leave blank';
                  return null;
                }
            ),
            SpacerV(10),
            BaseTextField(
              controller: _provider.phone,
                label: 'Phone number',
                type: TextInputType.phone,
                validator: (value) {
                  if(value?.isEmpty ?? true) return 'Please Don\'t leave blank';
                  if(!validatePhone(value ?? '')) return 'Please enter a correct phone number';
                  return null;
                }
            ),
            SpacerV(10),
            BaseTextField(
              controller: _provider.address,
                label: 'Address',
                validator: (value) {
                  if(value?.isEmpty ?? true) return 'Please Don\'t leave blank';
                  return null;
                }
            ),
            SpacerV(10),
          ],
        ),
      ),
    );
  }
}
