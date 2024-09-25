import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/global/controllers/auth.dart';

class UserHeader extends GetView<AuthController> {
  const UserHeader({super.key});

  @override
  // TODO: implement controller
  AuthController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClayContainer(
            height: 50,
            width: 50,
            borderRadius: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [Text("Welcome"), Text(controller.user!.name)],
            ),
          )
        ],
      ),
    );
  }
}
