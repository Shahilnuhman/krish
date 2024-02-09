import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krish/modules/home/view/homeScreenPage.dart';
import 'package:krish/modules/offers/view/offers_page.dart';
import 'package:krish/modules/settings/view/settingsPage.dart';
import 'package:krish/support/theme/theme.dart';

class BottomNavigation extends StatelessWidget {
  final String activeIcon;
  const BottomNavigation({Key? key, this.activeIcon = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors(context).white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavigationIcon(
            iconLabel: "Home",
            iconData: Icons.home,
            isActive: activeIcon == "home",
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.pushAndRemoveUntil(
                  context, HomeScreenPage.route(), (route) => false);
            },
          ),
          BottomNavigationIcon(
            iconLabel: "Offers",
            iconData: Icons.discount,
            isActive: activeIcon == "offers",
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.pushAndRemoveUntil(
                  context, OffersPage.route(), (route) => false);
            },
          ),
          Consumer(builder: (context, ref, child) {
            return BottomNavigationIcon(
              iconLabel: "Settings",
              iconData: Icons.settings,
              isActive: activeIcon == "settings",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context, SettingPage.route(), (route) => false);
              },
            );
          }),
        ],
      ),
    );
  }
}

class BottomNavigationIcon extends StatelessWidget {
  final String iconLabel;
  final IconData iconData;
  final bool isActive;
  final Function() onTap;

  const BottomNavigationIcon(
      {Key? key,
      required this.iconData,
      required this.iconLabel,
      required this.isActive,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 68,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: 35,
              color: isActive ? colors(context).text : colors(context).white,
            ),
            const Spacer(),
            Icon(
              iconData,
              color: isActive
                  ? colors(context).primaryIcon
                  : colors(context).primaryIcon!.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                iconLabel,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  color: colors(context).primaryIcon,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
