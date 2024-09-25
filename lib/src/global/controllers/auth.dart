// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:libco_exchange/src/global/endpoints/api.dart';
import 'package:libco_exchange/src/global/exceptions/app_exceptions.dart';
import 'package:libco_exchange/src/modules/app_freeze/app_freeze.dart';
import 'package:libco_exchange/src/modules/start/start_screen.dart';

import '../../modules/home/home_screen.dart';
import '../../modules/login/login_view.dart';
import '../models/Auth/login/login_request.dart';
import '../models/Auth/login/login_response.dart';
import '../models/Auth/register/register_request.dart';
import '../models/User/user.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  Box? tokenBox;
  User? user;
  String? token;
  AuthService service = AuthService();

  AuthController() {
    init();
  }

  Future<void> init() async {
    try {
      var data = await httpCall.get(
        ApiendPoints.freezeStatus,
      );
      print(data.statusCode);
      if (data.statusCode == 200) {
        print(data.data);
        if (data.data['data'] != null) {
          if (data.data["data"]["freez"] == "0") {
            print((data.data["data"] as Map<String, dynamic>).keys);
            tokenBox = await Hive.openBox("token");
            token = tokenBox!.get('token');

            if (token != null) {
              await refreshToken();
              await getUser();
              Get.offAll(HomeScreen());
            } else {
              Get.offAll(StartScreen());
            }
            update();
          } else {
            Get.offAll(AppFreezed());
          }
        }
      }
    } on DioError catch (e) {
      print(e.toString());
      Get.offAll(AppFreezed());
      if (e.response != null) print(e.response!.data);
      if (e.type == DioErrorType.other) {}
    }
  }

  Future<bool> refreshToken() async {
    // token = await service.refresh(token!);
    print(tokenBox!.get("email"));
    print(tokenBox!.get("password"));
    return await login(LoginReq(
        email: tokenBox!.get("email"), password: tokenBox!.get("password")));
  }

  Future<bool> login(LoginReq req) async {
    try {
      LoginResponse response = await service.login(req);
      print(response.status);
      if (response.status != 200) {
        Get.snackbar("Error", response.message!);
        // Get.back();
        update();
        return false;
      } else {
        user = response.user;
        print(user);
        token = response.token;
        tokenBox!.put("token", token);
        tokenBox!.put("email", req.email);
        tokenBox!.put("password", req.password);
        print(token);
        update();
        // Get.offAll(HomeScreen());
        return true;
      }
    } on Exception catch (e) {
      // TODO
      Get.snackbar("Error", e.toString());
      return false;
    }
  }

  Future<bool> register(SignUpRequest req) async {
    try {
      LoginResponse response = await service.register(req);
      if (response.status != 200) {
        // if (response.status == 200) {
        //   Get.snackbar("Success",
        //       "Confirmation emaile sent to ${req.email} please confirm then login");
        //   Get.offAll(LoginScreen());
        // }
        Get.snackbar("", response.message!);
        return false;
      } else {
        user = response.user;
        token = response.token;
        tokenBox!.put("token", token);
        tokenBox!.put("email", req.email);
        tokenBox!.put("password", req.password);
        print(token);
        update();
        // Get.to(HomeScreen());
        return true;
      }
    } on Exception catch (e) {
      // TODO
      return false;
    }
  }

  Future<void> updateProfile(SignUpRequest req) async {
    LoginResponse response = await service.updateProfile(req, token!);
    if (response.message != null) {
      if (response.status == 200) {
        Get.snackbar("Success",
            "Confirmation emaile sent to ${req.email} please confirm then login");
        Get.offAll(HomeScreen());
      }
      Get.snackbar("", response.message!);
      await getUser();
    } else {
      update();
    }
  }

  Future<void> logOut() async {
    user = User.empty();
    token = null;
    tokenBox!.clear();
    print(token);
    update();
    Get.to(() => StartScreen());
    Get.snackbar("Success", "Logged out successfully");
    return;
  }

  Future<User> getUser() async {
    if (token == null) {
      // Get.offAll(LoginScreen());
      return User.empty();
    }
    User response = await service.getUser(token!);
    // print(response.toString());
    user = response;
    update();
    return response;
  }
}

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}
