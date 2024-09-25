import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/global/controllers/exchange.dart';
import 'package:libco_exchange/src/global/utils/colors.dart';
import 'package:libco_exchange/src/modules/exchange/recive_money.dart';
import 'package:libco_exchange/src/modules/exchange/send_mony.dart';

class CompaniesScreen extends StatelessWidget {
  CompaniesScreen({super.key, required this.type});
  int type;
  ExchangeController controller = Get.put(ExchangeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              "Send Money".tr,
              style: Get.theme.textTheme.headlineSmall,
            ),
          ),
          iconTheme: IconThemeData(color: AppColors.secodary),
        ),
        body: FutureBuilder(
          future: controller.getCompanies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: Get.size.width,
                    child: Wrap(
                      children: snapshot.data!.data
                          .map((e) => GestureDetector(
                                onTap: () {
                                  controller.setCompany(e);
                                  if (type == 0) {
                                    Get.to(() => SendMoneyScreen());
                                  } else {
                                    Get.to(() => ReciveMoneyScreen());
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: Get.size.width / 2.5,
                                    width: Get.size.width / 2.5,
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                child: Image.network(e.logo)),
                                            Expanded(
                                              child: Text(
                                                e.name,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.primary),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
