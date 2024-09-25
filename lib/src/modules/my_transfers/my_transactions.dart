import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/global/controllers/exchange.dart';

import '../../global/widgets/user_header.dart';

class MyTransactionsScreen extends GetView {
  MyTransactionsScreen({super.key});

  ExchangeController controller = Get.put(ExchangeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            const UserHeader(),
            const SizedBox(
              height: 25,
            ),
            FutureBuilder(
              future: controller.getTransactions(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClayContainer(
                            width: Get.size.width,
                            borderRadius: 22,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text("Reference Number".tr),
                                        ),
                                        Text(snapshot
                                            .data![index].referenceNumber
                                            .toString())
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text("Company Name".tr),
                                        ),
                                        Text(snapshot.data![index].companyName
                                            .toString())
                                      ],
                                    ),
                                  ),
                                  if (snapshot.data![index].transferInfo !=
                                      null)
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text("Receiver name".tr),
                                          ),
                                          Text(snapshot
                                              .data![index].transferInfo!.name
                                              .toString())
                                        ],
                                      ),
                                    ),
                                  if (snapshot.data![index].transferInfo !=
                                      null)
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text("Receiver phone".tr),
                                          ),
                                          Text(snapshot
                                              .data![index].transferInfo!.phone
                                              .toString())
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text("Send amount".tr),
                                        ),
                                        Text(
                                            "${snapshot.data![index].sendAmount} ${snapshot.data![index].sendCurrency}")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text("Receive amount".tr),
                                        ),
                                        Text(
                                            "${snapshot.data![index].receiveAmount} ${snapshot.data![index].receiveCurrency}")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                              "Receive amount After Commision"
                                                  .tr),
                                        ),
                                        Text(
                                            "${snapshot.data![index].receiveAmountAfterCom} ${snapshot.data![index].receiveCurrency}")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text("Commision Value".tr),
                                        ),
                                        Text(
                                            "${snapshot.data![index].commissionValue} ${snapshot.data![index].receiveCurrency}")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text("Fee Type".tr),
                                        ),
                                        Text("${snapshot.data![index].feeType}")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
