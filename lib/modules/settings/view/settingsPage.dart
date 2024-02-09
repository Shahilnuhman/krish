import 'package:flutter/material.dart';
import 'package:krish/support/theme/theme.dart';
import 'package:krish/support/transition/transition.dart';
import 'package:krish/support/common_widgets/bottomNavigationBar.dart';
import 'package:krish/support/common_widgets/menuItem.dart';
import 'package:lottie/lottie.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  static Route route() {
    return AppFadeTransition(page: const SettingPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const SizedBox(),
            title: Text("App Settings",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: colors(context).text))),
        bottomNavigationBar: BottomNavigation(activeIcon: "settings"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MenuItem(iconData: Icons.person, iconLabel: "Profile"),
            MenuItem(iconData: Icons.settings, iconLabel: "App"),
            MenuItem(iconData: Icons.info, iconLabel: "About"),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Lottie.asset(
                'assets/images/settingsLottie.json',
                height: 200,
                repeat: false,
              ),
            )
          ],
        ));
  }
}
