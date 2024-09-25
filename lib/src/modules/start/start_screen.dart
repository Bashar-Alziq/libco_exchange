import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/global/utils/colors.dart';
import 'package:libco_exchange/src/modules/login/login_view.dart';
import 'package:libco_exchange/src/modules/signup/signup_view.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: SizedBox(
          //     // width: Get.size.width,
          //     child: Image.asset(
          //       "assets/imgs/back.png",
          //       fit: BoxFit.fitWidth,
          //       width: Get.size.width,
          //     ),
          //   ),
          // ),
          Positioned.fill(
            // width: Get.size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/Wallet-amico 1.svg"),
                const Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 24),
                ),
                const Text(
                  "LYBIANO EXCHANGE",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  child: ClayContainer(
                    width: 300,
                    height: 60,
                    borderRadius: 18,
                    surfaceColor: AppColors.primary,
                    child: Center(
                        child: Text(
                      "Login".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SignUpScreen());
                  },
                  child: ClayContainer(
                    width: 300,
                    height: 60,
                    depth: 3,
                    borderRadius: 18,
                    surfaceColor: AppColors.primary,
                    child: const Center(
                        child: Text(
                      "Create new account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
