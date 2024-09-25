import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/global/widgets/user_header.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../global/controllers/app.dart';
import '../../global/controllers/auth.dart';
import '../../global/utils/colors.dart';
import '../../global/utils/padding.dart';
import '../../global/widgets/background.dart';
import '../login/login_view.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final AppController appController = Get.find<AppController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: AppPading.defaultPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              UserHeader(),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  appController.showLangDialog();
                  // Get.to(const TimerScreen());
                },
                child: ClayContainer(
                  height: 85,
                  width: 322,
                  borderRadius: 18,
                  child: Padding(
                    padding: AppPading.defaultPadding,
                    child: Row(
                      children: [
                        const Icon(Icons.language_outlined,
                            color: AppColors.primary),
                        const SizedBox(
                          width: 25,
                        ),
                        Text(
                          "lang".tr,
                          style: Get.theme.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  // if (authController.token == null) {
                  //   Get.to(LoginScreen());
                  // } else {
                  //   // Get.to(ProfileScreen());
                  // }
                },
                child: ClayContainer(
                  height: 85,
                  width: 322,
                  borderRadius: 18,
                  child: Padding(
                    padding: AppPading.defaultPadding,
                    child: Row(
                      children: [
                        const Icon(Icons.share, color: AppColors.primary),
                        const SizedBox(
                          width: 25,
                        ),
                        Text(
                          "share".tr,
                          style: Get.theme.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  authController.logOut();
                },
                child: ClayContainer(
                  height: 85,
                  width: 322,
                  borderRadius: 18,
                  child: Padding(
                    padding: AppPading.defaultPadding,
                    child: Row(
                      children: [
                        const Icon(Icons.logout, color: AppColors.primary),
                        const SizedBox(
                          width: 25,
                        ),
                        Text(
                          "logOut".tr,
                          style: Get.theme.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(appController.appIfno["address"]),
              Text(appController.appIfno["phone1"]),
              Text(appController.appIfno["phone2"]),
            ],
          ),
        ),
      ),
    );
  }
}
