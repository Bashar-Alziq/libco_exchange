import 'package:libco_exchange/src/global/models/exchange/company.dart';

class CompaniesResponse {
  List<Company> data;
  String message;
  int code;
  CompaniesResponse(
      {required this.data, required this.message, required this.code});

  factory CompaniesResponse.fromJson(Map<String, dynamic> json) {
    List<Company> companies = (json["data"] as List<dynamic>).map(
      (e) {
        return Company.fromJson(e);
      },
    ).toList();
    return CompaniesResponse(
        data: companies, message: json["message"], code: json["code"]);
  }
}
