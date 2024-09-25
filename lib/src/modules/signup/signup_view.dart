import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/utils/colors.dart';
import '../../global/utils/padding.dart';
import '../../global/widgets/background.dart';
import '../../global/widgets/logo.dart';
import '../login/login_view.dart';
import 'controllers/register_controller.dart';

class SignUpScreen extends GetView {
  SignUpScreen({super.key});
  @override
  final RegisterController controller = Get.put(RegisterController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          const Background(),
          GetBuilder(
            init: controller,
            builder: (controller) => SingleChildScrollView(
              child: Padding(
                padding: AppPading.defaultPadding,
                child: Form(
                  // autovalidateMode: AutovalidateMode,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Text(
                        "greeting".tr,
                        style: Get.theme.textTheme.headlineMedium,
                      ),
                      Text(
                        "login_hint".tr,
                      ),
                      const SizedBox(),
                      Padding(
                        padding: AppPading.defaultPadding,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: controller.name,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.person_outline,
                                      color: AppColors.primary,
                                      size: 30,
                                    ),
                                    label: Text(
                                      "username".tr,
                                      style: Get.theme.textTheme.bodyMedium,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "username is not valid";
                                  } else {
                                    if (value!.length < 6) {
                                      return "username must be more than 6 characters";
                                    }
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: controller.email,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: AppColors.primary,
                                      size: 30,
                                    ),
                                    label: Text(
                                      "email".tr,
                                      style: Get.theme.textTheme.bodyMedium,
                                    )),
                                validator: (value) {
                                  if (!GetUtils.isEmail(value!)) {
                                    return "email is not valid";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: controller.phone,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      color: AppColors.primary,
                                      size: 30,
                                    ),
                                    label: Text(
                                      "phone".tr,
                                      style: Get.theme.textTheme.bodyMedium,
                                    )),
                                validator: (value) {
                                  if (!GetUtils.isPhoneNumber(value!)) {
                                    return "phone is not valid";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                  controller: controller.password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                          Icons.lock_outlined,
                                          color: AppColors.primary,
                                          size: 30),
                                      label: Text(
                                        "password".tr,
                                        style: Get.theme.textTheme.bodyMedium,
                                      )),
                                  validator: (value) {
                                    if (value!.length < 8) {
                                      return "Password Should be longer than 8 chars";
                                    } else {
                                      return null;
                                    }
                                  }),
                              const SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                width: 250,
                                height: 58,
                                child: TextButton(
                                  // style: ButtonStyle(
                                  //     backgroundColor:
                                  //         MaterialStateProperty.all<Color>(
                                  //             Colors.transparent),
                                  //     shape: MaterialStateProperty.all<
                                  //             RoundedRectangleBorder>(
                                  //         RoundedRectangleBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(25.0),
                                  //             side: const BorderSide(
                                  //                 color: AppColors.primary,
                                  //                 width: 2)))),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      controller.sendLoginReq();
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "register".tr,
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(LoginScreen());
                                },
                                child: Text(
                                  "haveAccount".tr,
                                  style:
                                      const TextStyle(color: AppColors.primary),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
