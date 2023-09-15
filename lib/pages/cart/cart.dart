import 'package:cdio_web/components/box/check-out-box.dart';
import 'package:cdio_web/components/product/product-cart-item.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/layout/Layout.dart';
import 'package:cdio_web/pages/cart/provider/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CheckOutBoxProvider.shared,
      child: ChangeNotifierProvider(
        create: (context) => CartProvider(context)..fetchCart(),
        child: const _View(),
      ),
    );
  }
}


class _View extends StatefulWidget {
  const _View({super.key});

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pet shop',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SpacerV(100),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 25,
                runSpacing: 25,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    constraints: const BoxConstraints(
                      maxWidth: 800,
                    ),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Shopping bag',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SpacerV(30),
                        const _Bag()
                      ],
                    ),
                  ),
                 const CheckoutBox()
                ],
              ),
              SpacerV(100),
            ],
          ),
        ),
      ),
    );
  }
}

class _Bag extends StatefulWidget {
  const _Bag({super.key});

  @override
  State<_Bag> createState() => _BagState();
}

class _BagState extends State<_Bag> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();
    return provider.isLoadingCart ? const Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ),
    ) : provider.carts.isEmpty ? const SizedBox(
      height: 120,
      width: double.infinity,
      child: Center(
        child: Text(
          'Empty',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    ) : Column(
      mainAxisSize: MainAxisSize.min,
      children: provider.carts.map((e) => ProductCartItem(e)).toList(),
    );
  }
}

