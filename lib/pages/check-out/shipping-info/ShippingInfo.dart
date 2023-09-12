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
              SpacerV(size: 30),
              BaseTextField(
                  label: 'Email'
              ),
              SpacerV(size: 10),
              Row(
                children: [
                  Expanded(
                    child: BaseTextField(
                        label: 'First name'
                    ),
                  ),
                  SpacerH(size: 10),
                  Expanded(
                    child: BaseTextField(
                        label: 'Last name'
                    ),
                  ),
                ],
              ),
              SpacerV(size: 10),
              BaseTextField(
                  label: 'Phone number'
              ),
              SpacerV(size: 10),
              Row(
                children: [
                  Expanded(
                    child: BaseTextField(
                        label: 'Provice/City'
                    ),
                  ),
                  SpacerH(size: 10),
                  Expanded(
                    child: BaseTextField(
                        label: 'District'
                    ),
                  ),
                  SpacerH(size: 10),
                  Expanded(
                    child: BaseTextField(
                        label: 'Ward'
                    ),
                  ),
                  SpacerH(size: 10),
                  Expanded(
                    child: BaseTextField(
                        label: 'Street'
                    ),
                  ),
                ],
              ),
              SpacerV(size: 10),
            ],
          ),
        ],
      ),
    );
  }
}
