import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/components/product/product-cart-item.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/components/text_field/BaseTextField.dart';
import 'package:cdio_web/components/title/TitleExpansionTile.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/layout/Layout.dart';
import 'package:cdio_web/pages/check-out/payment/payment-selection.dart';
import 'package:cdio_web/pages/check-out/shipping-info/ShippingInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 25,
          runSpacing: 25,
          children: [
            Column(
              children: [
                const ShippingInfo(),
                SpacerV(25),
                const PaymentSelection(),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  constraints: const BoxConstraints(
                      maxWidth: 600,
                      minWidth: 400
                  ),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$125.8',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            'Shipping cost',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$1.3',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$125.8',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      // const Row(
                      //   children: [
                      //     Text(
                      //       'Discount',
                      //       style: TextStyle(
                      //         fontSize: 12,
                      //       ),
                      //     ),
                      //     Spacer(),
                      //     Text(
                      //       '\$1.3',
                      //       style: TextStyle(
                      //         fontSize: 12,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      SpacerV(25),
                      SizedBox(
                          width: double.infinity,
                          child: FillButton(child: const Text('CONTINUE'), onTap: (){
                            // showCupertinoDialog(context: context,
                            //   builder: (BuildContext context) {
                            //   return CupertinoAlertDialog(
                            //     content: SizedBox(
                            //         child: Column(
                            //           children: [
                            //
                            //           ],
                            //         )
                            //       ),
                            //     );
                            //   },
                            // );
                            context.push('/order');
                          }
                          )
                      )
                    ],
                  ),
                ),
                // SpacerV(25),
                // Container(
                //   color: Colors.white,
                //   padding: const EdgeInsets.all(20),
                //   constraints: const BoxConstraints(
                //       maxWidth: 600,
                //       minWidth: 400
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Text(
                //         'Discount coupon',
                //         style: TextStyle(
                //             fontSize: 14,
                //             fontWeight: FontWeight.bold
                //         ),
                //       ),
                //       SpacerV(size: 25),
                //       Row(
                //         children: [
                //           Expanded(
                //             child: SizedBox(
                //               height: 50,
                //               child: TextFormField(
                //                 decoration: const InputDecoration(
                //                     hintText: 'Code',
                //                     hintStyle: TextStyle(
                //                         fontSize: 14
                //                     ),
                //                     border: OutlineInputBorder(
                //                         borderRadius: BorderRadius.zero
                //                     )
                //                 ),
                //               ),
                //             ),
                //           ),
                //           SpacerH(size: 10),
                //           FillButton(child: const Text('APPLY'), onTap: (){
                //           })
                //         ],
                //       )
                //     ],
                //   ),
                // )
              ],
            )
          ],
        ),
        SpacerV(100),
        SizedBox(
          height: 400,
          width: double.infinity,
          child: Image.network(
            'https://i.pinimg.com/originals/44/38/42/443842e79f65f2077a39f6d9d448fd1a.jpg',
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}

extension on _CheckOutState {}
