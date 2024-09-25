import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/modules/home/home_screen.dart';

import '../../../global/controllers/auth.dart';
import '../../../global/models/Auth/login/login_request.dart';

class LoginController extends GetxController {
  AuthController auth = Get.find<AuthController>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> sendLoginReq() async {
    if (GetUtils.isEmail(email.text) && password.text.length >= 8) {
      Future.delayed(Duration.zero, () {
        Get.bottomSheet(
            WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: const Column(
                children: [Text("Please Wait"), CircularProgressIndicator()],
              ),
            ),
            isDismissible: false);
      });
      LoginReq req = LoginReq(email: email.text, password: password.text);
      bool data = await auth.login(req);
      if (data) {
        Get.offAll(HomeScreen());
      } else
        Get.back(closeOverlays: true, canPop: false);
    } else {
      print("errrrrrrrrrrrrrrrrrrrr");
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
    // auth.dispose();
  }
}
