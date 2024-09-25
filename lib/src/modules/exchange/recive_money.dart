import 'package:clay_containers/clay_containers.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/global/controllers/exchange.dart';
import 'package:libco_exchange/src/global/models/exchange/bill.dart';
import 'package:libco_exchange/src/modules/home/home_screen.dart';

import '../../global/utils/colors.dart';

class ReciveMoneyScreen extends GetView<ExchangeController> {
  const ReciveMoneyScreen({super.key});
  @override
  // TODO: implement controller
  ExchangeController get controller => Get.find();

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
                  "Transfer Info",
                  style: Get.theme.textTheme.headlineSmall,
                ),
              ),
              iconTheme: const IconThemeData(color: AppColors.secodary),
            ),
            body: SizedBox(
                width: Get.size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text("Please Contact Libko Team.")],
                )));
      },
    );
  }
}
