class PaymentDestination {
  int? id;
  String? desName;
  String? desShortName;
  String? desParentId;
  String? desLogo;
  int? sortIndex;

  PaymentDestination(
      {this.id,
        this.desName,
        this.desShortName,
        this.desParentId,
        this.desLogo,
        this.sortIndex});

  PaymentDestination.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    desName = json['desName'];
    desShortName = json['desShortName'];
    desParentId = json['desParentId'];
    desLogo = json['desLogo'];
    sortIndex = json['sortIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['desName'] = desName;
    data['desShortName'] = desShortName;
    data['desParentId'] = desParentId;
    data['desLogo'] = desLogo;
    data['sortIndex'] = sortIndex;
    return data;
  }
}