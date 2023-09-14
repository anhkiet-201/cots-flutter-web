import 'package:cdio_web/api/services/AuthService.dart';
import 'package:cdio_web/app.dart';
import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/utils/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';


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
            if(context.app.user != null)
              IconButton(onPressed: () {
                context.push('/cart');
              }, icon: Icon(Iconsax.shopping_bag, color: widget.enableExpanded ? iconColor : Colors.black,)),
            SpacerH(),
            _profile(iconColor),
            IconButton(onPressed: (){
              showDialog(context: context, builder: (_) => AlertDialog(
                contentPadding: EdgeInsets.zero,
                content: SizedBox(
                  width: 600,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        height: 0
                      ),
                      prefixIcon: Icon(Iconsax.search_normal)
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                  ),
                ),
              ));
            }, icon: const Icon(
              Iconsax.search_normal,
              color: Colors.white,
            )),
            const SizedBox(width: 50,)
          ],
          title: ClickAble(
            child: Text(
              'Pet shop',
              style: TextStyle(
              color: widget.enableExpanded ? iconColor : Colors.black,
                fontWeight: FontWeight.bold
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

  Widget _profile(Color? iconColor) {
    context.watch<App>();
    if(context.app.user == null) {
      return IconButton(onPressed: () {
        //_googleSignIn.signIn();
        context.push('/login');
      }, icon: Icon(Icons.login_rounded, color: widget.enableExpanded ? iconColor : Colors.black,));
    }
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            context.app.user?.imageUrl ?? 'https://cafefcdn.com/thumb_w/640/203337114487263232/2022/3/3/photo1646280815645-1646280816151764748403.jpg',
            width: 25,
            height: 25,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20,),
        ClickAble(
          child: Text(
            'Logout',
            style: TextStyle(
                color: widget.enableExpanded ? iconColor : Colors.black,
              fontSize: 12
            ),
          ),
          onClick: () {
            AuthService.shared.dang_xuat();
            context.app.user = null;
            LocalStorageService.jwt = null;
          },
        )
      ],
    );
  }
}
