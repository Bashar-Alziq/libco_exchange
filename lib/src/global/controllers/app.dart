// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';

import '../common/loading.dart';
import '../endpoints/api.dart';
import '../exceptions/app_exceptions.dart';

class AppController extends GetxController {
  LoadingState loadingState = LoadingState.done;
  Box? appBox;
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', '')},
    {'name': 'العربية', 'locale': const Locale('ar', '')},
  ];
  Map<String, dynamic> appIfno = {};
  List social = [];
  updateLanguage(Locale local) {
    Get.back();
    Get.updateLocale(local);
    var loc = locale.firstWhere(
      (element) => element['locale'] == local,
      orElse: () => {'name': 'العربية', 'locale': const Locale('ar', '')},
    );
    if (appBox != null) {
      appBox!.put("lang", loc["name"]);
    }
  }

  AppController() {
    init();
  }

  void init() async {
    // await [
    //   Permission.manageExternalStorage,
    //   Permission.storage,
    // ].request();
    try {
      var data = await httpCall.get(
        ApiendPoints.appInfo,
      );
      print(data.statusCode);
      if (data.statusCode == 200) {
        print(data.data);
        if (data.data['data'] != null) {
          appIfno = data.data["data"];
        }
      }
    } on DioError catch (e) {
      print(e.toString());
      if (e.response != null) print(e.response!.data);
      if (e.type == DioErrorType.other) {}
    }
    appBox = await Hive.openBox("app");
    var lang = appBox!.get("lang");
    if (lang != null) {
      var loc = locale.firstWhere(
        (element) => element['name'] == lang,
        orElse: () => {'name': 'العربية', 'locale': const Locale('ar', '')},
      );
      updateLanguage(loc["locale"]);
    }
  }

  showLoadingDialog(
      {required Future<LoadingState> func,
      required VoidCallback callback,
      required VoidCallback failCallback}) async {
    Get.to(const LoadingUI());
    LoadingState state = await func;
    if (state == LoadingState.done) {
      callback;
    } else {
      failCallback;
    }
  }

  showLangDialog() {
    Get.dialog(AlertDialog(
      title: Text('Choose Your Language'.tr),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Text(locale[index]['name']),
                  onTap: () {
                    print(locale[index]['name']);
                    updateLanguage(locale[index]['locale']);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.blue,
              );
            },
            itemCount: locale.length),
      ),
    ));
  }

  // Future<void> getSocialUrls() async {
  //   try {
  //     print("wwwwwwwwwwwwwwwwwwwwwwwwwww");
  //     var data = await httpCall.get(
  //       ApiendPoints.getSocial,
  //     );
  //     print(data.statusCode);
  //     if (data.statusCode == 200) {
  //       print("data:${data.data}");
  //       social = data.data;
  //       update();
  //       return;
  //     }
  //     return;
  //   } on DioError catch (e) {
  //     print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
  //     print(e.type);
  //     if (e.response != null) print(e.response!.data);
  //     if (e.type == DioErrorType.other) {
  //       return;
  //     }
  //     return;
  //   }
  // }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController());
  }
}
