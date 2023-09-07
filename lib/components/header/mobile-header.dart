import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MobileHeader extends StatefulWidget {
  const MobileHeader({super.key, this.enableExpanded = true, this.customBanner});
  final bool enableExpanded;
  final Widget? customBanner;

  @override
  State<MobileHeader> createState() => _MobileHeaderState();
}

class _MobileHeaderState extends State<MobileHeader> {
  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.maybeOf(context);
    return SliverLayoutBuilder(
      builder: (BuildContext context, SliverConstraints constraints) {
        const bannerHeight = 700.0;
        final iconColor = Color.lerp(Colors.white, Colors.black, constraints.scrollOffset / (bannerHeight + MediaQuery.of(context).padding.top));
        final bannerColor = Color.lerp(Colors.transparent, Colors.white, constraints.scrollOffset / (bannerHeight + MediaQuery.of(context).padding.top));
        return SliverAppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          expandedHeight: widget.enableExpanded ? bannerHeight : null,
          flexibleSpace:  widget.enableExpanded ? FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                widget.customBanner ?? Image.network(
                  'https://static2-images.vnncdn.net/files/publish/2022/12/12/meo-1-333.jpg',
                  fit: BoxFit.cover,
                ),
                Container(
                  color: bannerColor,
                )
              ],
            ),
          ) : null,
          pinned: true,
          actions: [
            IconButton(onPressed: () {
              scaffold?.openEndDrawer();
            }, icon: Icon(Icons.menu, color: widget.enableExpanded ? iconColor : Colors.black,)),
            const SizedBox(width: 20,)
          ],
          title: Text(
            'Pet shop',
            style: TextStyle(
                color: widget.enableExpanded ? iconColor : Colors.black
            ),
          ),
          centerTitle: true,
        );
      },
    );
  }
}
