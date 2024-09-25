import 'dart:io';

import 'package:country_currency_pickers/country.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/global/controllers/auth.dart';
import 'package:libco_exchange/src/global/endpoints/api.dart';
import 'package:libco_exchange/src/global/exceptions/app_exceptions.dart';
import 'package:libco_exchange/src/global/models/exchange/companies_response.dart';
import 'package:libco_exchange/src/global/models/exchange/company.dart';
import 'package:libco_exchange/src/global/models/exchange/lyd_prices.dart';

import '../models/exchange/bill.dart';

enum FeeType { sender, reciver }

enum ReciveType { cash, bank }

class ExchangeController extends GetxController {
  TextEditingController amount = TextEditingController();
  TextEditingController amountCountry = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController bank_name = TextEditingController();
  TextEditingController account_name = TextEditingController();
  TextEditingController account_number = TextEditingController();
  TextEditingController swift_code = TextEditingController();
  TextEditingController iBAN = TextEditingController();
  TextEditingController routine_number = TextEditingController();
  TextEditingController branche_name = TextEditingController();
  TextEditingController ifc_code = TextEditingController();

  AuthController auth = Get.find<AuthController>();
  Company? selectedCompany;
  bool isLoading = false;
  Country? selectedCountry;
  Currency? fromCountry;
  Currency? toCountry;
  FeeType feeType = FeeType.sender;
  ReciveType reciveType = ReciveType.cash;
  void setCompany(Company c) {
    selectedCompany = c;
    update();
  }

  Future<CompaniesResponse> getCompanies() async {
    var data = await httpCall.get(ApiendPoints.companies,
        options: Options(headers: {
          HttpHeaders.authorizationHeader: "Bearer ${auth.token}",
          HttpHeaders.acceptHeader: '*/*'
        }));
    return CompaniesResponse.fromJson(data.data);
  }

  Future<LydPrices> getlydprices() async {
    var data = await httpCall.get(ApiendPoints.lydPrices,
        options: Options(headers: {
          HttpHeaders.authorizationHeader: "Bearer ${auth.token}",
          HttpHeaders.acceptHeader: '*/*'
        }));
    print(data.data["data"]);
    return LydPrices.fromJson(data.data["data"]);
  }

  Future<List<Bill>> getTransactions() async {
    var data = await httpCall.get(ApiendPoints.transfers,
        options: Options(headers: {
          HttpHeaders.authorizationHeader: "Bearer ${auth.token}",
          HttpHeaders.acceptHeader: '*/*'
        }));
    List<Bill> transfers = [];
    transfers =
        (data.data["data"] as List).map((e) => Bill.fromJson(e)).toList();
    return transfers;
  }

  Future<Bill> sendReq() async {
    print({
      "transfer_type": "send",
      "company_id": selectedCompany!.id,
      "send_amount": amount.text,
      "receive_currency": selectedCountry!.currencyCode,
      "fee_type": feeType.toString()
    });
    var data = await httpCall.post(ApiendPoints.sendtransfer,
        options: Options(headers: {
          HttpHeaders.authorizationHeader: "Bearer ${auth.token}",
          HttpHeaders.acceptHeader: '*/*'
        }),
        data: {
          "transfer_type": "send",
          "company_id": selectedCompany!.id,
          "send_amount": amount.text,
          "receive_currency": selectedCountry!.currencyCode,
          "fee_type": feeType == FeeType.sender ? "sender" : "reciver",
          "promotion_code": code.text,
          "receive_type": reciveType == ReciveType.cash ? "cash" : "bank",
          // if cash
          "name": name.text,
          "phone": phone.text,
          // if bank
          "bank_name": bank_name.text,
          "account_name": account_name.text,
          "account_number": account_number.text,
          "swift_code": swift_code.text,
          "IBAN": iBAN.text,
          "routine_number": routine_number.text,
          "branche_name": branche_name.text,
          "IFC_code": ifc_code.text
        });
    print(data.data);
    // return CompaniesResponse.fromJson(data.data);
    return Bill.fromJson(data.data["data"]);
  }

  Future<Bill> reciveReq() async {
    var data = await httpCall.post(ApiendPoints.recivetransfer,
        options: Options(headers: {
          HttpHeaders.authorizationHeader: "Bearer ${auth.token}",
          HttpHeaders.acceptHeader: '*/*'
        }),
        data: {
          "transfer_type": "receive",
          "company_id": selectedCompany!.id,
          "send_amount": amount.text,
          "send_currency": selectedCountry!.currencyCode,
          "fee_type": feeType == FeeType.sender ? "sender" : "reciver",
          "promotion_code": code.text
        });
    print(data.data);
    // return CompaniesResponse.fromJson(data.data);
    return Bill.fromJson(data.data["data"]);
  }

  Future<dynamic> exchangePrices({bool lyd = false}) async {
    try {
      isLoading = true;
      update();
      print({
        "from": lyd ? "LYD" : fromCountry!.code,
        "to": lyd ? selectedCountry!.currencyCode! : toCountry!.code,
        "amount": amount.text,
      });
      var data = await httpCall.post(ApiendPoints.exchangePrices,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer ${auth.token}",
            HttpHeaders.acceptHeader: '*/*'
          }),
          data: {
            "from": lyd ? "LYD" : fromCountry!.code,
            "to": lyd ? selectedCountry!.currencyCode! : toCountry!.code,
            "amount": amount.text,
          });
      print(data.data["data"]);
      // return CompaniesResponse.fromJson(data.data);
      isLoading = false;
      if (lyd) {
        amountCountry.text = data.data["data"]["result"].toString();
      }
      update();

      return data.data["data"];
    } on Exception catch (e) {
      isLoading = false;
      print(e);
      update();
      Get.snackbar("Error", "message");
    }
  }
}
