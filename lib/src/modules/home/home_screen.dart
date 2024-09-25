import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:libco_exchange/src/global/controllers/app.dart';
import 'package:libco_exchange/src/global/utils/colors.dart';
import 'package:libco_exchange/src/global/widgets/user_header.dart';
import 'package:libco_exchange/src/modules/companies/companies_screen.dart';
import 'package:libco_exchange/src/modules/profile/profile_screen.dart';
import 'package:libco_exchange/src/modules/settings/settings_screen.dart';

import '../exchange/recive_money.dart';
import '../exchange_prices/exchange_prices.dart';
import '../my_transfers/my_transactions.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: HomePage(),
//       bottomNavigationBar: BottomNavigationBar(onTap: (value) {}, items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
//         BottomNavigationBarItem(icon: Icon(Icons.call), label: "call"),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
//       ]),
//     );
//   }
// }
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> pages = [
    HomePage(),
    MyTransactionsScreen(),
    ProfileScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primary,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home".tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet), label: "my transfers".tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "profile".tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings".tr),
          ]),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });
  AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: SizedBox(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const UserHeader(),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(CompaniesScreen(
                      type: 0,
                    ));
                  },
                  child: ClayContainer(
                    height: 100,
                    width: 350,
                    surfaceColor: AppColors.primary,
                    borderRadius: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                "Send Money".tr,
                                style: Get.theme.textTheme.headlineSmall!
                                    .copyWith(color: Colors.white),
                              )),
                          CircleAvatar(
                              backgroundColor: AppColors.primary,
                              radius: 40,
                              child: SvgPicture.asset(
                                  "assets/icons/send_mony.svg"))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const ReciveMoneyScreen());
                  },
                  child: ClayContainer(
                    height: 100,
                    width: 350,
                    surfaceColor: AppColors.primary,
                    borderRadius: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                "Recive Money".tr,
                                style: Get.theme.textTheme.headlineSmall!
                                    .copyWith(color: Colors.white),
                              )),
                          CircleAvatar(
                              backgroundColor: AppColors.primary,
                              radius: 40,
                              child: SvgPicture.asset(
                                  "assets/icons/recive_mony.svg"))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.dialog(Container(
                            height: 500,
                            alignment: Alignment.center,
                            // clipBehavior: Clip.antiAlias,
                            child: Material(
                              child: SizedBox(
                                height: 300,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(appController.appIfno["address"]),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ClayContainer(
                                          height: 75,
                                          width: 299,
                                          surfaceColor: AppColors.textFormFill,
                                          borderRadius: 18,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      appController
                                                          .appIfno["phone1"],
                                                      style: Get.theme.textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primary),
                                                    )),
                                                SvgPicture.asset(
                                                    "assets/icons/call_libco.svg")
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ClayContainer(
                                          height: 75,
                                          width: 299,
                                          surfaceColor: AppColors.textFormFill,
                                          borderRadius: 18,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      appController
                                                          .appIfno["phone2"],
                                                      style: Get.theme.textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primary),
                                                    )),
                                                SvgPicture.asset(
                                                    "assets/icons/call_libco.svg")
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ));
                        },
                        child: ClayContainer(
                          height: 120,
                          width: 160,
                          surfaceColor: AppColors.textFormFill,
                          borderRadius: 18,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/call_libco.svg"),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Call Us".tr,
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ExchangPricesScreen());
                        },
                        child: ClayContainer(
                          height: 120,
                          width: 160,
                          surfaceColor: AppColors.textFormFill,
                          borderRadius: 18,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/exchange_prices.svg"),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Excange Prices".tr,
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      )),
    );
  }
}
