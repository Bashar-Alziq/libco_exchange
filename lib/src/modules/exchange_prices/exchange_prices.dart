import 'package:clay_containers/clay_containers.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/controllers/exchange.dart';
import '../../global/utils/colors.dart';

class ExchangPricesScreen extends GetView<ExchangeController> {
  ExchangPricesScreen({super.key});
  dynamic result;
  @override
  ExchangeController get controller => Get.put(ExchangeController());

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
                "Exchange Prices",
                style: Get.theme.textTheme.headlineSmall,
              ),
            ),
            iconTheme: IconThemeData(color: AppColors.secodary),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "From Currency *:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showCurrencyPicker(
                        context: context,
                        showFlag: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (Currency currency) {
                          controller.fromCountry = currency;
                          controller.update();
                        },
                      );
                    },
                    child: ClayContainer(
                        height: 70,
                        width: Get.size.width,
                        borderRadius: 18,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              if (controller.fromCountry != null)
                                Text(
                                  controller.fromCountry!.symbol ?? "",
                                  style: TextStyle(fontSize: 22),
                                ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  controller.fromCountry != null
                                      ? controller.fromCountry!.code ?? ""
                                      : "Select Country",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Icon(Icons.arrow_downward)
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "To Currency *:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showCurrencyPicker(
                        context: context,
                        showFlag: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (Currency currency) {
                          controller.toCountry = currency;
                          controller.update();
                        },
                      );
                    },
                    child: ClayContainer(
                        height: 70,
                        width: Get.size.width,
                        borderRadius: 18,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              if (controller.toCountry != null)
                                Text(
                                  controller.toCountry!.symbol ?? "",
                                  style: TextStyle(fontSize: 22),
                                ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  controller.toCountry != null
                                      ? controller.toCountry!.code ?? ""
                                      : "Select Country",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Icon(Icons.arrow_downward)
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Amount*:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ClayContainer(
                      // height: 70,
                      // width: Get.size.width,
                      borderRadius: 18,
                      child: TextField(
                        controller: controller.amount,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          result = null;
                          controller.update();
                        },
                      )),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: Get.size.width,
                    height: 58,
                    child: TextButton(
                      onPressed: () async {
                        result = null;
                        controller.update();
                        var data = await controller.exchangePrices();
                        result = data["result"];
                        controller.update();
                      },
                      child: controller.isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Convert".tr,
                              style: Get.theme.textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  if (result != null)
                    ClayContainer(
                      height: 200,
                      width: Get.size.width,
                      child: Column(
                        children: [
                          Text(
                            "The Result Is :",
                            style: TextStyle(
                                color: AppColors.primary, fontSize: 22),
                          ),
                          Text("$result")
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
