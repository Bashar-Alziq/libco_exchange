import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/controllers/app.dart';
import '../../global/utils/colors.dart';
import '../../global/utils/padding.dart';
import '../../global/widgets/background.dart';
import '../../global/widgets/logo.dart';
import '../signup/signup_view.dart';
import 'controllers/login_controller.dart';

class LoginScreen extends GetView {
  LoginScreen({super.key});
  @override
  final LoginController controller = Get.put(LoginController());
  final AppController appcontroller = Get.find<AppController>();
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Center(child: Logo()),
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      "greeting".tr,
                      style: Get.theme.textTheme.headlineMedium!
                          .copyWith(color: AppColors.primary),
                    ),
                    Text(
                      "login_hint".tr,
                    ),
                    Padding(
                      padding: AppPading.defaultPadding,
                      child: Center(
                        child: Form(
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: controller.email,
                                keyboardType: TextInputType.text,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "username is not valid";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person_outline,
                                        color: AppColors.primary, size: 30),
                                    // const Icon(
                                    //   Icons.person_outline,
                                    //   color: AppColors.primary,
                                    // ),
                                    label: Text(
                                      "username".tr,
                                      style: Get.theme.textTheme.bodyLarge,
                                    )),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                controller: controller.password,
                                obscureText: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.length < 8) {
                                    return "Password Should be longer than 8 chars";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline,
                                        color: AppColors.primary, size: 30),
                                    label: Text(
                                      "password".tr,
                                      style: Get.theme.textTheme.bodyLarge,
                                    )),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              SizedBox(
                                width: 250,
                                height: 58,
                                child: TextButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      controller.sendLoginReq();
                                    }
                                  },
                                  child: Text(
                                    "Login".tr,
                                    style: Get.theme.textTheme.bodyMedium!
                                        .copyWith(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.to(const ForgetPasswordScreen());
                                },
                                child: Text(
                                  "ForgetPassword".tr,
                                  style:
                                      const TextStyle(color: AppColors.primary),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
