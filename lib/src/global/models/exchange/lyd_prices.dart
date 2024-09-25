class LydPrices {
  double? uSD;
  double? eUR;

  LydPrices({this.uSD, this.eUR});

  factory LydPrices.fromJson(Map<String, dynamic> json) {
    return LydPrices(uSD: json['USD'], eUR: json['EUR']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['USD'] = this.uSD;
    data['EUR'] = this.eUR;
    return data;
  }
}
