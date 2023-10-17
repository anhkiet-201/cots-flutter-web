import 'package:cdio_web/api/model/BaseResponseModel.dart';
import 'package:cdio_web/api/model/Product.dart';
import 'package:cdio_web/api/services/ProductService.dart';
import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/product/product-card-skeleton.dart';
import 'package:cdio_web/components/product/product-card.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/extensions/snack_bar.dart';
import 'package:flutter/material.dart';

class ProductHorizontalList extends StatefulWidget {
  const ProductHorizontalList({super.key, required this.type});
  final ProductHorizontalListType type;
  @override
  State<ProductHorizontalList> createState() => _ProductHorizontalListState();
}

class _ProductHorizontalListState extends State<ProductHorizontalList> {
  List<Product> _products = [];

  Future<void> _fetch() async {
    await ProductService.shared.list_product_info_homepage(
      keyword: widget.type.keyword,
        pageIndex: 1,
      pageSize: 4,
      categoryId: widget.type.category
    ).onError((error, stackTrace){
          context.showSnackBar('Fetch data error', type: SnackBarType.error);
          return Pageable.empty();
    }).then((value) {
      _products = value.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    final type = widget.type;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: 1360
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(type.title),
            // const Divider(height: 1,color: Colors.grey, indent: 50, endIndent: 50,),
            SpacerV(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: FutureBuilder(
                  future: _fetch(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 20,
                        runSpacing: 20,
                        children: _skeleton(),
                        //children: _products.map((e) => ProductCard(e)).toList()
                      );
                    }
                    return Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: _products.map((e) => ProductCard(e)).toList()
                    );
                  },
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _skeleton() {
    return [
      for(int i = 0; i < 4; i ++)
        const ProductCardSkeleton(),
    ];
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
          const Spacer(),
          Button(
              child: Row(
                children: [
                  const Text('SHOP ALL'),
                  SpacerH(5),
                  const Icon(Icons.arrow_right_alt_rounded)
                ],
              ),
              onTap: (){
                context.push('/search',{
                  'keyword': widget.type.keyword,
                  'categoryId' : widget.type.category
                });
              }
          )
        ],
      ),
    );
  }
}

enum ProductHorizontalListType {
  cloth,
  food,
  discount,
  dog,
  cat;

  String get title {
    switch(this) {
      case ProductHorizontalListType.cat: return 'For Cat';
      case ProductHorizontalListType.dog: return 'For Dog';
      case ProductHorizontalListType.food: return 'Pet Foodies';
      case ProductHorizontalListType.cloth: return 'Pet Cloths';
      case ProductHorizontalListType.discount: return 'Discounting';
    }
  }

  String get keyword {
    switch(this) {
      case ProductHorizontalListType.cat: return '1';
      case ProductHorizontalListType.dog: return '2';
      case ProductHorizontalListType.food: return '3';
      case ProductHorizontalListType.cloth: return '4';
      case ProductHorizontalListType.discount: return 'discount';
    }
  }

  int? get category {
    switch(this) {
      case ProductHorizontalListType.cat: return 2;
      case ProductHorizontalListType.dog: return 1;
      case ProductHorizontalListType.food: return 3;
      case ProductHorizontalListType.cloth: return 4;
      case ProductHorizontalListType.discount: return null;
    }
  }
}
