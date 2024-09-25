import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class MyAppBar extends AppBar {
  MyAppBar({super.key});

  @override
  List<Widget>? get actions => [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.secodary,
            ))
      ];
  @override
  Widget? get leading => PopupMenuButton(
      // add icon, by default "3 dot" icon
      icon: const Icon(
        Icons.settings,
        color: AppColors.secodary,
      ),
      itemBuilder: (context) {
        return [
          // const PopupMenuItem<int>(value: 0, child: SearchButton()),
          const PopupMenuItem<int>(
            value: 1,
            child: Row(
              children: [
                Icon(Icons.favorite_border),
                SizedBox(
                  width: 20,
                ),
                Text("المفضلة"),
              ],
            ),
          ),
        ];
      },
      onSelected: (value) {
        if (value == 0) {
        } else if (value == 1) {
          // Get.to(const FavCoursesScreen());
        }
      });
}

class HomeAppBar extends AppBar {
  HomeAppBar({super.key});

  @override
  List<Widget>? get actions => [
        Padding(
          padding: const EdgeInsets.all(8.0),
          // child: FavButton(),
        )
      ];
  @override
  Widget? get leading => Padding(
        padding: const EdgeInsets.all(8.0),
        // child: SearchButton(),
      );
}
