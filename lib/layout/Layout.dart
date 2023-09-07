import 'package:cdio_web/components/footer/footer.dart';
import 'package:cdio_web/components/footer/mobile-footer.dart';
import 'package:cdio_web/components/header/header.dart';
import 'package:cdio_web/components/header/mobile-header.dart';
import 'package:cdio_web/layout/ResponsiveLayout.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  Layout(
      {super.key,
      required this.children,
      this.enableExpanded = false,
      this.banner}) {
    child = null;
  }

  Layout.single({super.key, this.enableExpanded = false, this.banner, required this.child});

  late List<Widget> children;
  late final Widget? child;
  final bool enableExpanded;
  final Widget? banner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveLayout(
        builder: (isMobile) {
          return CustomScrollView(
            slivers: [
              _header(isMobile),
              SliverToBoxAdapter(
                  child: child ?? Column(
                crossAxisAlignment: CrossAxisAlignment.center ,
                children: [...children, _footer(isMobile)],
              )),
            ],
          );
        },
      ),
      endDrawer: Container(
        color: Colors.white,
        width: 300,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}

extension on Layout {
  Widget _header(bool isMobile) {
    return isMobile
        ? MobileHeader(
            enableExpanded: enableExpanded,
            customBanner: banner,
          )
        : Header(
            enableExpanded: enableExpanded,
            customBanner: banner,
          );
  }

  Widget _footer(bool isMobile) {
    return isMobile ? const MobileFooter() : const Footer();
  }
}
