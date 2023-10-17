class Category {
  int? id;
  String? name;
  bool? isShowHome;
  String? seoDescription;
  String? seoTitle;
  String? seoAlias;

  Category(
      {this.id,
        this.name,
        this.isShowHome,
        this.seoDescription,
        this.seoTitle,
        this.seoAlias});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isShowHome = json['isShowHome'];
    seoDescription = json['seoDescription'];
    seoTitle = json['seoTitle'];
    seoAlias = json['seoAlias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['isShowHome'] = isShowHome;
    data['seoDescription'] = seoDescription;
    data['seoTitle'] = seoTitle;
    data['seoAlias'] = seoAlias;
    return data;
  }
}
