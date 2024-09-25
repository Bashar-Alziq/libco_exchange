import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app.dart';
import '../widgets/background.dart';

enum LoadingState { loading, fail, done }

class LoadingUI extends GetView<AppController> {
  const LoadingUI({
    super.key,
  });
  @override
  AppController get controller => Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: [
        Background(),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    ));
  }
}
