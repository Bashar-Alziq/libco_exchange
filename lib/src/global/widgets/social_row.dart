import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/app.dart';
import '../utils/colors.dart';

class SocialRow extends StatelessWidget {
  SocialRow({super.key});
  final AppController controller = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 56,
        child: GetBuilder(
          init: controller,
          builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.textFormFill),
                  child: IconButton(
                    onPressed: () {
                      Share.share("Get Programming with RS fo free now");
                    },
                    icon: const Icon(
                      Icons.share,
                      color: AppColors.primary,
                    ),
                    color: AppColors.textFormFill,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.textFormFill),
                  child: IconButton(
                    onPressed: () async {
                      Map<String, dynamic> u = controller.social.firstWhere(
                          (element) =>
                              (element["name"] as String).contains("whatsapp"));
                      final Uri url = Uri.parse(u['link']);
                      if (!await launchUrl(url,
                          mode: LaunchMode.externalApplication)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    icon: SvgPicture.asset('assets/svg/WhatsApp_1_.svg'),
                    color: AppColors.textFormFill,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.textFormFill),
                  child: IconButton(
                    onPressed: () async {
                      Map<String, dynamic> u = controller.social.where(
                              (element) =>
                                  (element["name"] as String).contains("tele"))
                          as Map<String, dynamic>;
                      final Uri url = Uri.parse(u['link']);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    icon: SvgPicture.asset('assets/svg/Vector (2).svg'),
                    color: AppColors.textFormFill,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.textFormFill),
                  child: IconButton(
                    onPressed: () async {
                      Map<String, dynamic> u = controller.social.firstWhere(
                          (element) =>
                              (element["name"] as String).contains("facebook"));
                      final Uri url = Uri.parse(u['link']);
                      if (!await launchUrl(url,
                          mode: LaunchMode.externalApplication)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    icon: SvgPicture.asset('assets/svg/Facebook.svg'),
                    color: AppColors.textFormFill,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.textFormFill),
                  child: IconButton(
                    onPressed: () async {
                      Map<String, dynamic> u = controller.social.where(
                          (element) => (element["name"] as String)
                              .contains("youtube")) as Map<String, dynamic>;
                      final Uri url = Uri.parse(u['link']);
                      if (!await launchUrl(url,
                          mode: LaunchMode.externalApplication)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    icon: SvgPicture.asset('assets/svg/Youtube.svg'),
                    color: AppColors.textFormFill,
                  ),
                ),
              ],
            );
          },
        ));
  }
}
