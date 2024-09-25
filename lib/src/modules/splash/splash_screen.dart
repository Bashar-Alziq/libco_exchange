// Dart imports:
// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:

import 'package:get/get.dart';
import 'package:libco_exchange/src/global/utils/colors.dart';
import 'package:libco_exchange/src/modules/start/start_screen.dart';
import 'package:lottie/lottie.dart';

import '../../global/controllers/auth.dart';
import '../../global/widgets/background.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AuthController auth = Get.put<AuthController>(AuthController());
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const Positioned.fill(child: Background()),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Lybiano exchange",
                  style: Get.textTheme.headlineLarge,
                ),
                LottieBuilder.asset("assets/icons/loading.json")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
