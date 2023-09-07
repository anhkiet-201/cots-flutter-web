import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);


class Header extends StatefulWidget {
  const Header({super.key, this.enableExpanded = true, this.customBanner});
  final bool enableExpanded;
  final Widget? customBanner;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((event) async {
      final header = await _googleSignIn.currentUser?.authHeaders;
      print(header?['Authorization']);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, SliverConstraints constraints) {
        const bannerHeight = 700.0;
        final iconColor = Color.lerp(Colors.white, Colors.black, constraints.scrollOffset / (bannerHeight + MediaQuery.of(context).padding.top));
        final bannerColor = Color.lerp(Colors.transparent, Colors.white, constraints.scrollOffset / (bannerHeight + MediaQuery.of(context).padding.top));
        return SliverAppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          expandedHeight: widget.enableExpanded ? bannerHeight : null,
          flexibleSpace: widget.enableExpanded ? FlexibleSpaceBar(
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
              _googleSignIn.signIn();
            }, icon: Icon(Icons.login_rounded, color: widget.enableExpanded ? iconColor : Colors.black,)),
            const SizedBox(width: 50,)
          ],
          title: ClickAble(
            child: Text(
              'Pet shop',
              style: TextStyle(
              color: widget.enableExpanded ? iconColor : Colors.black
              ),
            ),
            onClick: () {
              context.push('/');
            },
          ),
          centerTitle: true,
        );
      },
    );
  }
}
