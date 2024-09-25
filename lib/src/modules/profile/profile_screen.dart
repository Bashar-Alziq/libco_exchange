import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/modules/signup/controllers/register_controller.dart';

import '../../global/utils/colors.dart';
import '../../global/utils/padding.dart';
import '../../global/widgets/logo.dart';

class ProfileScreen extends GetView {
  ProfileScreen({super.key});
  @override
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder(
              init: controller,
              builder: (controller) {
                controller.auth.getUser();
                if (controller.initialized && controller.auth.user != null) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: AppPading.defaultPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(child: Logo()),
                          Padding(
                            padding: AppPading.defaultPadding,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClayContainer(
                                    borderRadius: 18,
                                    child: TextFormField(
                                      controller: controller.name,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.person_outline,
                                            color: AppColors.primary,
                                            size: 30,
                                          ),
                                          label: Text(
                                            "username".tr,
                                            style:
                                                Get.theme.textTheme.bodyLarge,
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  ClayContainer(
                                    borderRadius: 18,
                                    child: TextFormField(
                                      controller: controller.email,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.email_outlined,
                                            color: AppColors.primary,
                                            size: 30,
                                          ),
                                          label: Text(
                                            "email".tr,
                                            style:
                                                Get.theme.textTheme.bodyLarge,
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  // ClayContainer(
                                  //   borderRadius: 33,
                                  //   child: TextFormField(
                                  //     controller: controller.password,
                                  //     // obscureText: true,
                                  //     decoration: InputDecoration(
                                  //         prefixIcon: const Icon(Icons.lock,
                                  //             color: AppColors.primary,
                                  //             size: 30),
                                  //         label: Text(
                                  //           "password".tr,
                                  //           style:
                                  //               Get.theme.textTheme.bodyText1,
                                  //         )),
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    height: 33,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    height: 58,
                                    child: TextButton(
                                      onPressed: () {
                                        controller.updateProfileReq();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "save".tr,
                                          style: Get.theme.textTheme.bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              })),
    );
  }
}
