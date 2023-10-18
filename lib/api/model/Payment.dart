class Payment {
  int? id;
  String? paymentContent;
  String? paymentCurrency;
  String? paymentRefId;
  double? requiredAmount;
  String? paymentDate;
  String? expireDate;
  String? paymentLanguage;
  int? merchantId;
  int? paymentDestinationId;
  int? paymentStatus;
  double? paidAmount;

  Payment(
      {this.id,
        this.paymentContent,
        this.paymentCurrency,
        this.paymentRefId,
        this.requiredAmount,
        this.paymentDate,
        this.expireDate,
        this.paymentLanguage,
        this.merchantId,
        this.paymentDestinationId,
        this.paymentStatus,
        this.paidAmount});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentContent = json['paymentContent'];
    paymentCurrency = json['paymentCurrency'];
    paymentRefId = json['paymentRefId'];
    requiredAmount = json['requiredAmount'];
    paymentDate = json['paymentDate'];
    expireDate = json['expireDate'];
    paymentLanguage = json['paymentLanguage'];
    merchantId = json['merchantId'];
    paymentDestinationId = json['paymentDestinationId'];
    paymentStatus = json['paymentStatus'];
    paidAmount = json['paidAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['paymentContent'] = paymentContent;
    data['paymentCurrency'] = paymentCurrency;
    data['paymentRefId'] = paymentRefId;
    data['requiredAmount'] = requiredAmount;
    data['paymentDate'] = paymentDate;
    data['expireDate'] = expireDate;
    data['paymentLanguage'] = paymentLanguage;
    data['merchantId'] = merchantId;
    data['paymentDestinationId'] = paymentDestinationId;
    data['paymentStatus'] = paymentStatus;
    data['paidAmount'] = paidAmount;
    return data;
  }
}
