import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/modules/home/home_screen.dart';

import '../../../global/controllers/auth.dart';
import '../../../global/models/Auth/register/register_request.dart';

class RegisterController extends GetxController {
  AuthController auth = Get.find<AuthController>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController birthday = TextEditingController();
  @override
  void onInit() {
    if (auth.user != null) {
      name.text = auth.user!.name;
      email.text = auth.user!.email;
    }

    super.onInit();
  }

  void sendLoginReq() async {
    if (GetUtils.isEmail(email.text) && password.text.length >= 8) {
      Future.delayed(Duration.zero, () {
        Get.bottomSheet(WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const Column(
            children: [Text("Please Wait"), CircularProgressIndicator()],
          ),
        ));
      });
      SignUpRequest req = SignUpRequest(
          email: email.text,
          password: password.text,
          name: name.text,
          password_confirmation: password.text,
          phone: phone.text,
          birthday: birthday.text);

      bool data = await auth.register(req);
      if (data) {
        Get.offAll(HomeScreen());
      } else {
        Get.snackbar("can't create account", "already exist");
        Get.back(closeOverlays: true, canPop: false);
      }
    }
  }

  void updateProfileReq() async {
    if (GetUtils.isEmail(email.text)) {
      Future.delayed(Duration.zero, () {
        Get.bottomSheet(WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const Column(
            children: [Text("Please Wait"), CircularProgressIndicator()],
          ),
        ));
      });
      SignUpRequest req = SignUpRequest(
          email: email.text,
          password: "",
          name: name.text,
          password_confirmation: "",
          phone: "",
          birthday: "");

      await auth.updateProfile(req);
      Get.back();
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    phone.dispose();
    passwordConfirm.dispose();
    birthday.dispose();
    super.dispose();
    // auth.dispose();
  }
}
