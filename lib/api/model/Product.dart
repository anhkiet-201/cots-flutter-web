class Product {
  int? id;
  String? name;
  double? price;
  double? originalPrice;
  int? stock;
  int? categoryId;
  String? categoryName;
  String? description;
  String? details;
  String? seoDescription;
  String? seoTitle;
  String? seoAlias;
  double? totalPriceDiscount;
  List<ListProductImage>? listProductImage;
  // List<Null>? listDiscount;

  Product(
      {this.id,
        this.name,
        this.price,
        this.originalPrice,
        this.stock,
        this.categoryId,
        this.categoryName,
        this.description,
        this.details,
        this.seoDescription,
        this.seoTitle,
        this.seoAlias,
        this.totalPriceDiscount,
        this.listProductImage,
        // this.listDiscount
      });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    originalPrice = json['originalPrice'];
    stock = json['stock'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    description = json['description'];
    details = json['details'];
    seoDescription = json['seoDescription'];
    seoTitle = json['seoTitle'];
    seoAlias = json['seoAlias'];
    totalPriceDiscount = json['totalPriceDiscount'];
    if (json['listProductImage'] != null) {
      listProductImage = <ListProductImage>[];
      json['listProductImage'].forEach((v) {
        listProductImage!.add(ListProductImage.fromJson(v));
      });
    }
    // if (json['listDiscount'] != null) {
    //   listDiscount = <Null>[];
    //   json['listDiscount'].forEach((v) {
    //     listDiscount!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['originalPrice'] = originalPrice;
    data['stock'] = stock;
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['description'] = description;
    data['details'] = details;
    data['seoDescription'] = seoDescription;
    data['seoTitle'] = seoTitle;
    data['seoAlias'] = seoAlias;
    data['totalPriceDiscount'] = totalPriceDiscount;
    if (listProductImage != null) {
      data['listProductImage'] =
          listProductImage!.map((v) => v.toJson()).toList();
    }
    // if (this.listDiscount != null) {
    //   data['listDiscount'] = this.listDiscount!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class ListProductImage {
  int? id;
  String? imageUrl;

  ListProductImage({this.id, this.imageUrl});

  ListProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    return data;
  }
}