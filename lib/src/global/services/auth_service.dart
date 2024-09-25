// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';

import '../endpoints/api.dart';
import '../exceptions/app_exceptions.dart';
import '../models/Auth/login/login_request.dart';
import '../models/Auth/login/login_response.dart';
import '../models/Auth/register/register_request.dart';
import '../models/User/user.dart';

class AuthService {
  Future<LoginResponse> login(LoginReq req) async {
    try {
      var data = await httpCall.post(ApiendPoints.login, data: req.toJSON());
      print(data.statusCode);
      if (data.statusCode == 200) {
        print(data.data);
        if (data.data['data'] != null) {
          if (data.data["data"]["token"] != null) {
            print((data.data["data"] as Map<String, dynamic>).keys);
            return LoginResponse.fromJson(data.data["data"]);
          }
          return LoginResponse.empty(data.data["message"]);
        }
        return LoginResponse.empty(data.data["message"]);
      }
      return LoginResponse.empty(data.statusMessage ?? "");
    } on DioError catch (e) {
      print(e.toString());
      if (e.response != null) print(e.response!.data);
      if (e.type == DioErrorType.other) {
        return LoginResponse.empty("Please Check the Internet Connection");
      }
      return LoginResponse.empty(e.toString(),
          status: e.response!.statusCode, user: User.empty());
    }
  }

  Future<LoginResponse> register(SignUpRequest req) async {
    try {
      var data = await httpCall.post(ApiendPoints.signup, data: req.toJson());
      print(data.statusCode);
      if (data.statusCode == 200) {
        print(data.data);
        if (data.data['data'] != null) {
          if (data.data["data"]["token"] != null) {
            print((data.data["data"] as Map<String, dynamic>).keys);
            return LoginResponse.fromJson(data.data["data"]);
          }
          return LoginResponse.empty(data.data["message"]);
        }
        return LoginResponse.empty(data.data["message"]);
      }
      return LoginResponse.empty(data.statusMessage ?? "");
    } on DioError catch (e) {
      print(e);
      if (e.response != null) print(e.response!.data);
      if (e.type == DioErrorType.other) {
        return LoginResponse.empty("Please Check the Internet Connection",
            status: 400);
      }
      return LoginResponse.empty(e.message,
          status: e.response!.statusCode, user: User.empty());
    }
  }

  Future<LoginResponse> updateProfile(SignUpRequest req, String token) async {
    try {
      var data = await httpCall.post(ApiendPoints.updateUser,
          data: {
            "email": req.email,
            "full_name": req.name,
            "username": req.name
          },
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            HttpHeaders.acceptHeader: '*/*'
          }));
      print(data.statusCode);
      if (data.statusCode == 200) {
        // print((data.data["data"] as Map).keys.toList().join(","));
        print(data.data);
        // if (data.data["success"] as bool) {
        //   return LoginResponse.empty(data.data["message"], status: 200);
        // }
        return LoginResponse.empty(data.data["message"].toString(),
            status: 200);
      }
      return LoginResponse.empty(data.statusMessage ?? "");
    } on DioError catch (e) {
      print(e.message);
      if (e.response != null) print(e.response!.data);
      if (e.type == DioErrorType.other) {
        return LoginResponse.empty("Please Check the Internet Connection");
      }
      return LoginResponse.empty(e.message,
          status: e.response!.statusCode, user: User.empty());
    }
  }

  Future<User> getUser(String token) async {
    try {
      var data = await httpCall.get(ApiendPoints.getUser,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            HttpHeaders.acceptHeader: '*/*'
          }));
      print(data.statusCode);
      if (data.statusCode == 200) {
        print(data.data["data"]["user"]);

        return User.fromJson(data.data['data']["user"]);
      }
      return User.empty();
    } on DioError catch (e) {
      print(e);
      if (e.response != null) print(e.response!.data);
      if (e.type == DioErrorType.other) {
        return User.empty();
      }
      return User.empty();
    }
  }

  Future<bool> logout(String token) async {
    try {
      var data = await httpCall.get(ApiendPoints.logout,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            HttpHeaders.acceptHeader: '*/*'
          }));
      print(data.data);

      return true;
    } on DioError catch (e) {
      print(e.message);
      if (e.response != null) print(e.response!.data);
      if (e.type == DioErrorType.other) {
        return false;
      }
      return false;
    }
  }
}
