import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/global/controllers/exchange.dart';
import 'package:libco_exchange/src/global/models/exchange/bill.dart';
import 'package:libco_exchange/src/modules/home/home_screen.dart';

import '../../global/utils/colors.dart';

class ReciverDataScreen extends GetView<ExchangeController> {
  ReciverDataScreen({super.key});
  @override
  ExchangeController get controller => Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                "Reciver Info".tr,
                style: Get.theme.textTheme.headlineSmall,
              ),
            ),
            iconTheme: const IconThemeData(color: AppColors.secodary),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "name:".tr,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    ClayContainer(
                        // height: 70,
                        // width: Get.size.width,
                        borderRadius: 18,
                        child: TextFormField(
                          controller: controller.name,
                          decoration: const InputDecoration(hintText: ""),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "username is not valid";
                            } else {
                              if (value!.length < 4) {
                                return "username must be more than 6 characters";
                              }
                              return null;
                            }
                          },
                        )),
                    const SizedBox(
                      height: 33,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Phone:".tr,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    ClayContainer(
                        // height: 70,
                        // width: Get.size.width,
                        borderRadius: 18,
                        child: TextFormField(
                          controller: controller.phone,
                          decoration: const InputDecoration(hintText: ""),
                          validator: (value) {
                            if (!GetUtils.isPhoneNumber(value!)) {
                              return "phone is not valid";
                            } else {
                              return null;
                            }
                          },
                        )),
                    const SizedBox(
                      height: 33,
                    ),
                    if (controller.reciveType == ReciveType.bank)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Bank Name:".tr,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          ClayContainer(
                              // height: 70,
                              // width: Get.size.width,
                              borderRadius: 18,
                              child: TextField(
                                controller: controller.bank_name,
                                decoration: const InputDecoration(hintText: ""),
                              )),
                          const SizedBox(
                            height: 33,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Account Name:".tr,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          ClayContainer(
                              // height: 70,
                              // width: Get.size.width,
                              borderRadius: 18,
                              child: TextField(
                                controller: controller.account_name,
                                decoration: const InputDecoration(hintText: ""),
                              )),
                          const SizedBox(
                            height: 33,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Account Number:".tr,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          ClayContainer(
                              // height: 70,
                              // width: Get.size.width,
                              borderRadius: 18,
                              child: TextField(
                                controller: controller.account_number,
                                decoration: const InputDecoration(hintText: ""),
                              )),
                          const SizedBox(
                            height: 33,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Swift Code:".tr,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          ClayContainer(
                              // height: 70,
                              // width: Get.size.width,
                              borderRadius: 18,
                              child: TextField(
                                controller: controller.swift_code,
                                decoration: const InputDecoration(hintText: ""),
                              )),
                          const SizedBox(
                            height: 33,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Routine Number:".tr,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          ClayContainer(
                              // height: 70,
                              // width: Get.size.width,
                              borderRadius: 18,
                              child: TextField(
                                controller: controller.routine_number,
                                decoration: const InputDecoration(hintText: ""),
                              )),
                          const SizedBox(
                            height: 33,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Branche Name:".tr,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          ClayContainer(
                              // height: 70,
                              // width: Get.size.width,
                              borderRadius: 18,
                              child: TextField(
                                controller: controller.iBAN,
                                decoration: const InputDecoration(hintText: ""),
                              )),
                          const SizedBox(
                            height: 33,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "IFC Code:".tr,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          ClayContainer(
                              // height: 70,
                              // width: Get.size.width,
                              borderRadius: 18,
                              child: TextField(
                                controller: controller.ifc_code,
                                decoration: const InputDecoration(hintText: ""),
                              )),
                          const SizedBox(
                            height: 33,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "IBAN:",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          ClayContainer(
                              // height: 70,
                              // width: Get.size.width,
                              borderRadius: 18,
                              child: TextField(
                                controller: controller.iBAN,
                                decoration: const InputDecoration(hintText: ""),
                              )),
                          const SizedBox(
                            height: 33,
                          ),
                        ],
                      ),
                    SizedBox(
                      width: Get.size.width,
                      height: 58,
                      child: TextButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // controller.sendLoginReq();
                            Bill bill = await controller.sendReq();
                            // ignore: use_build_context_synchronously
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return WillPopScope(
                                  onWillPop: () async {
                                    return false;
                                  },
                                  child: Container(
                                    height: 500,
                                    alignment: Alignment.center,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        width: Get.size.width * 3.5 / 4,
                                        height: 500,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                                "Reference Number"
                                                                    .tr),
                                                          ),
                                                          Text(bill
                                                              .referenceNumber
                                                              .toString())
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                                "Company Name"
                                                                    .tr),
                                                          ),
                                                          Text(bill.companyName
                                                              .toString())
                                                        ],
                                                      ),
                                                    ),
                                                    if (bill.transferInfo !=
                                                        null)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                  "Receiver name"
                                                                      .tr),
                                                            ),
                                                            Text(bill
                                                                .transferInfo!
                                                                .name
                                                                .toString())
                                                          ],
                                                        ),
                                                      ),
                                                    if (bill.transferInfo !=
                                                        null)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                  "Receiver phone"
                                                                      .tr),
                                                            ),
                                                            Text(bill
                                                                .transferInfo!
                                                                .phone
                                                                .toString())
                                                          ],
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                                "Send amount"
                                                                    .tr),
                                                          ),
                                                          Text(
                                                              "${bill.sendAmount} ${bill.sendCurrency}")
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                                "Receive amount"
                                                                    .tr),
                                                          ),
                                                          Text(
                                                              "${bill.receiveAmount} ${bill.receiveCurrency}")
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                                "Receive amount After Commision"
                                                                    .tr),
                                                          ),
                                                          Text(
                                                              "${bill.receiveAmountAfterCom} ${bill.receiveCurrency}")
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Get.offAll(() =>
                                                        const HomeScreen());
                                                  },
                                                  child: Text(
                                                    "ok",
                                                    style: Get.theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
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
          ),
        );
      },
    );
  }
}
