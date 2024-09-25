import 'package:clay_containers/clay_containers.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:libco_exchange/src/global/controllers/exchange.dart';
import 'package:libco_exchange/src/global/models/exchange/bill.dart';
import 'package:libco_exchange/src/modules/home/home_screen.dart';
import 'package:libco_exchange/src/modules/reciver_data/reciver_data_screen.dart';

import '../../global/utils/colors.dart';

class SendMoneyScreen extends GetView<ExchangeController> {
  SendMoneyScreen({super.key});
  @override
  // TODO: implement controller
  ExchangeController get controller => Get.find();
  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Flexible(child: Text(country.name ?? ''))
        ],
      );
  String? distenation_error;
  String? amount_error;

  bool validate() {
    distenation_error = null;
    amount_error = null;
    if (controller.selectedCountry == null) {
      distenation_error = "Select Country".tr;
      controller.update();
      return false;
    }
    if (controller.amount.text.length < 1) {
      amount_error = "Amount in LYD".tr;
      controller.update();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Center(
              child: Text(
                "Transfer Info".tr,
                style: Get.theme.textTheme.headlineSmall,
              ),
            ),
            iconTheme: const IconThemeData(color: AppColors.secodary),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: controller.getlydprices(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                "${"USD to LYD:".tr} ${snapshot.data!.uSD!.toPrecision(2)}"),
                            Text(
                                "${"EUR to LYD:".tr} ${snapshot.data!.eUR!.toPrecision(2)}")
                          ],
                        );
                      }
                      return SizedBox();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Destination country *:".tr,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Theme(
                            data: Theme.of(context)
                                .copyWith(primaryColor: Colors.pink),
                            child: CountryPickerDialog(
                                titlePadding: EdgeInsets.all(8.0),
                                searchCursorColor: Colors.pinkAccent,
                                searchInputDecoration:
                                    InputDecoration(hintText: 'Search...'),
                                isSearchable: true,
                                title: Text('Select country'),
                                onValuePicked: (Country country) {
                                  controller.selectedCountry = country;
                                  controller.update();
                                },
                                itemBuilder: _buildDialogItem)),
                      );
                      // showCurrencyPicker(
                      //   context: context,
                      //   showFlag: true,
                      //   showCurrencyName: true,
                      //   showCurrencyCode: true,
                      //   onSelect: (Currency currency) {
                      //     controller.selectedCountry = currency;
                      //     controller.update();
                      //   },
                      // );
                    },
                    child: ClayContainer(
                        height: 70,
                        width: Get.size.width,
                        borderRadius: 18,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  controller.selectedCountry != null
                                      ? controller.selectedCountry!.name ?? ""
                                      : "Select Country".tr,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              const Icon(Icons.arrow_downward)
                            ],
                          ),
                        )),
                  ),
                  if (distenation_error != null)
                    Text(
                      distenation_error!,
                      style: TextStyle(color: Colors.red),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: Get.width * 3.5 / 4,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Amount in LYD".tr),
                                Text("Amount in Country".tr)
                              ],
                            ),
                          ),
                          ClayContainer(
                            height: 80,
                            width: Get.size.width,
                            borderRadius: 18,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: TextField(
                                    controller: controller.amount,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      if (validate()) {
                                        controller.exchangePrices(lyd: true);
                                      }
                                    },
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  controller.isLoading
                                      ? CircularProgressIndicator()
                                      : Expanded(
                                          child: TextField(
                                          controller: controller.amountCountry,
                                          keyboardType: TextInputType.number,
                                          enabled: false,
                                        ))
                                ],
                              ),
                            ),
                          ),
                          if (amount_error != null)
                            Text(
                              amount_error!,
                              style: TextStyle(color: Colors.red),
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Fee type *:".tr,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ClayContainer(
                      height: 70,
                      width: Get.size.width,
                      borderRadius: 18,
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DropdownButton<FeeType>(
                            isExpanded: true,
                            value: controller.feeType,
                            onChanged: (value) {
                              controller.feeType = value!;
                              controller.update();
                            },
                            items: [
                              DropdownMenuItem(
                                child: Text("Sender".tr),
                                value: FeeType.sender,
                              ),
                              DropdownMenuItem(
                                child: Text("Reciver".tr),
                                value: FeeType.reciver,
                              )
                            ],
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Promotion Code:".tr,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ClayContainer(
                      // height: 70,
                      // width: Get.size.width,
                      borderRadius: 18,
                      child: TextField(
                        controller: controller.code,
                        decoration: const InputDecoration(
                            hintText: "example: 4eo2-L2ew-DKe2"),
                      )),
                  const SizedBox(
                    height: 33,
                  ),
                  SizedBox(
                    width: Get.size.width,
                    height: 58,
                    child: TextButton(
                      onPressed: () async {
                        if (validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Scaffold(
                                body: Column(
                                  children: [
                                    Text(
                                      "choose recive type".tr,
                                      style: Get.theme.textTheme.headlineLarge,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.reciveType = ReciveType.cash;
                                        Get.to(() => ReciverDataScreen());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: Get.size.width / 3.5,
                                          width: Get.size.width,
                                          child: Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Cash".tr,
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .primary),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        AppColors.primary,
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.money,
                                                          color: Colors.white,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.reciveType = ReciveType.bank;
                                        Get.to(() => ReciverDataScreen());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: Get.size.width / 3.5,
                                          width: Get.size.width,
                                          child: Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Bank".tr,
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .primary),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        AppColors.primary,
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.wallet,
                                                          color: Colors.white,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        "Next Step".tr,
                        style: Get.theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
