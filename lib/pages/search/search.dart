import 'dart:html';

import 'package:cdio_web/api/model/BaseResponseModel.dart';
import 'package:cdio_web/api/model/Category.dart';
import 'package:cdio_web/api/model/Product.dart';
import 'package:cdio_web/api/services/CategoryService.dart';
import 'package:cdio_web/api/services/ProductService.dart';
import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:cdio_web/components/product/product-cart-list-item.dart';
import 'package:cdio_web/components/product/product-price.dart';
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
  bool _isLoadingCategories = false;
  final List<Category> _categories = [];
  final _search = TextEditingController();

  @override
  void initState() {
    _currentPage = int.tryParse(parameters['page'] ?? '') ?? 1;
    _categoryId = int.tryParse(parameters['categoryId'] ?? '');
    _search.text = parameters['keyword'] ?? '';
    _isLoading = true;
    _fetch_categories();
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
          height: 10,
        ),
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
          for (int i = 0; i < 4; i++) const ProductCartListItemSkeleton()
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
          child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _search,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: Icon(Iconsax.search_normal)),
              onFieldSubmitted: (_) {
                _onSubmit();
              },
            ),
          ),
          SizedBox(
              width: 150,
              height: 50,
              child: Center(
                child: _isLoadingCategories
                    ? const CircularProgressIndicator()
                    : DropdownButtonFormField<int>(
                        value: _categoryId ?? -1,
                        items: [
                          const DropdownMenuItem(
                            value: -1,
                            child: Text('All'),
                          ),
                          for (int i = 0; i < _categories.length; i++)
                            DropdownMenuItem(
                              value: _categories[i].id,
                              child: Text('${_categories[i].name}'),
                            )
                        ],
                        onChanged: (value) {
                          if ((value ?? -1) == -1) {
                            _categoryId = null;
                          } else {
                            _categoryId = value;
                          }
                          _onSubmit();
                        },
                        style: const TextStyle(fontSize: 12),
                        isExpanded: true,
                        elevation: 1,
                        borderRadius: BorderRadius.circular(10),
                        decoration: const InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 0.5)),
                          labelStyle: TextStyle(fontSize: 12),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 0.5)),
                        ),
                      ),
              ))
        ],
      )),
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
              _SearchItem(_products[i]),
            if (_currentPage < _totalPage) _loadMoreButton()
          ],
        ),
      ),
    );
  }

  Widget _loadMoreButton() {
    return ClickAble(
      onClick: _loadMore,
      child: Container(
        height: 50,
        width: 200,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all()),
        child: Center(
          child: _isLoadMore
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ))
              : const Text(
                  'LOAD MORE',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }

  _loadMore() {
    if (_isLoadMore) return;
    setState(() {
      _isLoadMore = true;
    });
    _currentPage += 1;
    _fetch();
  }

  _fetch() {
    _updateUrl();
    ProductService.shared
        .list_product_info_homepage(
            pageIndex: _currentPage,
            keyword: _search.text,
            categoryId: _categoryId)
        .onError((error, stackTrace) {
      return Pageable.empty();
    }).then((value) {
      _isLoading = false;
      _isLoadMore = false;
      _totalPage = value.totalPage;
      setState(() {
        _products.addAll(value.items);
      });
    });
  }

  _onSubmit() {
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
    params['page'] = _currentPage;
    params['categoryId'] = _categoryId;
    final paramsList = <String>[];
    params.forEach((key, value) {
      paramsList.add('$key=$value');
    });
    final path = paramsList.isEmpty ? '' : '/search?${paramsList.join('&')}';
    window.history.replaceState({}, 'Search', path);
  }

  _fetch_categories() {
    setState(() {
      _isLoadingCategories = true;
    });
    CategoryService.shared.get_all().then((value) {
      _categories.addAll(value);
      setState(() {
        _isLoadingCategories = false;
      });
    });
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
      constraints: const BoxConstraints(maxWidth: 800, minWidth: 600),
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
                          style: const TextStyle(fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${product.details}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${product.description}',
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ProductPrice(
                    product,
                    size: 18,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
