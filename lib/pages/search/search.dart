import 'dart:html';

import 'package:cdio_web/api/model/BaseResponseModel.dart';
import 'package:cdio_web/api/model/Product.dart';
import 'package:cdio_web/api/services/ProductService.dart';
import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:cdio_web/components/product/product-cart-list-item.dart';
import 'package:cdio_web/layout/Layout.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int _totalPage = 0;
  int? _categoryId;
  int _currentPage = 1;
  final List<Product> _products = [];
  bool _isLoadMore = false;
  bool _isLoading = false;
  final _search = TextEditingController();

  @override
  void initState() {
    _categoryId = int.tryParse(parameters['categoryId'] ?? '');
    _search.text = parameters['keyword'] ?? '';
    _isLoading = true;
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Search',
      children: [
        _searchBar(),
        const SizedBox(
          height: 50,
        ),
        _isLoading
            ? _loading()
            : _products.isEmpty
                ? _empty()
                : _listview()
      ],
    );
  }

  Widget _loading() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      color: Colors.white,
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1080),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for(int i = 0; i < 4; i++)
            const ProductCartListItemSkeleton()
        ],
      ),
    );
  }

  Widget _empty() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      color: Colors.white,
      height: 250,
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1080),
      child: const Center(
        child: Text(
          'Empty',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      color: Colors.white,
      height: 75,
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1080),
      child: Center(
        child: TextFormField(
          controller: _search,
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              prefixIcon: Icon(Iconsax.search_normal)
          ),
          onFieldSubmitted: (_) {_onSubmit();},
        ),
      ),
    );
  }

  Widget _listview() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1080),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < _products.length; i++) 
              _SearchItem(_products[i])
          ],
        ),
      ),
    );
  }

  _fetch() {
    ProductService.shared
        .list_product_info_homepage(
            pageIndex: _currentPage,
            keyword: _search.text,
            categoryId: _categoryId)
        .onError((error, stackTrace) {
      return Pageable.empty();
    }).then((value) {
     _isLoading = false;
      _totalPage = value.totalPage;
      setState(() {
        _products.addAll(value.items);
      });
    });
  }

  _onSubmit() {
    _updateUrl();
    setState(() {
      _isLoading = true;
    });
    _currentPage = 1;
    _products.clear();
    _fetch();
  }

  void _updateUrl() {
    var params = Map.from(parameters);
    params['keyword'] = _search.text;
    final paramsList = <String>[];
    params.forEach((key, value) {
      paramsList.add('$key=$value');
    });
    final path = paramsList.isEmpty ? '' : '/search?${paramsList.join('&')}';
    window.history.replaceState({}, 'Search', path);
  }
}

class _SearchItem extends StatelessWidget {
  const _SearchItem(this.product, {super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      height: 150,
      constraints: const BoxConstraints(
          maxWidth: 800,
          minWidth: 600
      ),
      child: Row(
        children: [
          BaseImage(
            product.listProductImage?.first.imageUrl ?? '',
            width: 120,
            height: 120,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${product.name}',
                          style: const TextStyle(
                              fontSize: 16
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Text(
                          'Option: option 1',
                          style: TextStyle(
                              fontSize: 12
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

