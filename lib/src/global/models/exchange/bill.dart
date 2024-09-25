class Bill {
  String? transferType;
  String? receiveType;
  TransferInfo? transferInfo;
  dynamic? referenceNumber;
  dynamic? companyId;
  String? companyName;
  String? feeType;
  String? sendCurrency;
  dynamic? sendAmount;
  dynamic? sendAmountUSD;
  String? receiveCurrency;
  dynamic? receiveAmount;
  dynamic? receiveAmountUSD;
  dynamic? promotionCodeValue;
  dynamic? commissionValue;
  dynamic? commissionValueAfterDiscount;
  dynamic? receiveAmountAfterCom;

  Bill(
      {this.transferType,
      this.receiveType,
      this.transferInfo,
      this.referenceNumber,
      this.companyId,
      this.companyName,
      this.feeType,
      this.sendCurrency,
      this.sendAmount,
      this.sendAmountUSD,
      this.receiveCurrency,
      this.receiveAmount,
      this.receiveAmountUSD,
      this.promotionCodeValue,
      this.commissionValue,
      this.commissionValueAfterDiscount,
      this.receiveAmountAfterCom});

  Bill.fromJson(Map<String, dynamic> json) {
    transferType = json['transfer_type'];
    receiveType = json['receive_type'];
    transferInfo = json['transfer_info'] != null
        ? new TransferInfo.fromJson(json['transfer_info'])
        : null;
    referenceNumber = json['reference_number'];
    companyId = json['company_id'];
    companyName = json['company_name'];
    feeType = json['fee_type'];
    sendCurrency = json['send_currency'];
    sendAmount = json['send_amount'];
    sendAmountUSD = json['send_amount_USD'];
    receiveCurrency = json['receive_currency'];
    receiveAmount = json['receive_amount'];
    receiveAmountUSD = json['receive_amount_USD'];
    promotionCodeValue = json['promotion_code_value'];
    commissionValue = json['commission_value'];
    commissionValueAfterDiscount = json['commission_value_after_discount'];
    receiveAmountAfterCom = json['receive_amount_after_com'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transfer_type'] = this.transferType;
    data['receive_type'] = this.receiveType;
    if (this.transferInfo != null) {
      data['transfer_info'] = this.transferInfo!.toJson();
    }
    data['reference_number'] = this.referenceNumber;
    data['company_id'] = this.companyId;
    data['company_name'] = this.companyName;
    data['fee_type'] = this.feeType;
    data['send_currency'] = this.sendCurrency;
    data['send_amount'] = this.sendAmount;
    data['send_amount_USD'] = this.sendAmountUSD;
    data['receive_currency'] = this.receiveCurrency;
    data['receive_amount'] = this.receiveAmount;
    data['receive_amount_USD'] = this.receiveAmountUSD;
    data['promotion_code_value'] = this.promotionCodeValue;
    data['commission_value'] = this.commissionValue;
    data['commission_value_after_discount'] = this.commissionValueAfterDiscount;
    data['receive_amount_after_com'] = this.receiveAmountAfterCom;
    return data;
  }
}

class TransferInfo {
  int? id;
  String? transferId;
  String? name;
  String? phone;
  String? createdAt;
  String? updatedAt;

  TransferInfo(
      {this.id,
      this.transferId,
      this.name,
      this.phone,
      this.createdAt,
      this.updatedAt});

  TransferInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transferId = json['transfer_id'];
    name = json['name'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transfer_id'] = this.transferId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
