import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/components/text_field/BaseTextField.dart';
import 'package:cdio_web/components/title/TitleExpansionTile.dart';
import 'package:flutter/material.dart';

class ShippingInfo extends StatefulWidget {
  const ShippingInfo({super.key});

  @override
  State<ShippingInfo> createState() => _ShippingInfoState();
}

class _ShippingInfoState extends State<ShippingInfo> {
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
            title: TitleExpansionTile(number: 1, label: 'Shipping address'),
            children: [
              SpacerV(30),
              BaseTextField(
                  label: 'Email'
              ),
              SpacerV(10),
              Row(
                children: [
                  Expanded(
                    child: BaseTextField(
                        label: 'First name'
                    ),
                  ),
                  SpacerH(10),
                  Expanded(
                    child: BaseTextField(
                        label: 'Last name'
                    ),
                  ),
                ],
              ),
              SpacerV(10),
              BaseTextField(
                  label: 'Phone number'
              ),
              SpacerV(10),
              Row(
                children: [
                  Expanded(
                    child: BaseTextField(
                        label: 'Provice/City'
                    ),
                  ),
                  SpacerH(10),
                  Expanded(
                    child: BaseTextField(
                        label: 'District'
                    ),
                  ),
                  SpacerH(10),
                  Expanded(
                    child: BaseTextField(
                        label: 'Ward'
                    ),
                  ),
                  SpacerH(10),
                  Expanded(
                    child: BaseTextField(
                        label: 'Street'
                    ),
                  ),
                ],
              ),
              SpacerV(10),
            ],
          ),
        ],
      ),
    );
  }
}
