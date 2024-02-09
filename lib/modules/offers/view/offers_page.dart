import 'package:flutter/material.dart';
import 'package:krish/support/constants.dart';
import 'package:krish/support/theme/theme.dart';
import 'package:krish/support/transition/transition.dart';
import 'package:krish/support/common_widgets/bottomNavigationBar.dart';
import 'package:krish/support/common_widgets/fadeShadowWidget.dart';
import 'package:lottie/lottie.dart';

// OffersPage widget represents a page showing special offers
class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  // Static method to create a route for navigating to this page
  static Route route() {
    return AppFadeTransition(page: const OffersPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Title of the page
        title: Text(
          "Special offers",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: colors(context).text
          ),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: const BottomNavigation(activeIcon: "offers"),
      // Body of the page
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Information about special offers
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "These are some special offers for you!",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      // Lottie animation for visual appeal
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Lottie.asset(
                          'assets/images/offerLottie.json',
                          height: 60,
                          repeat: false,
                        ),
                      ),
                    ],
                  ),
                ),
                // List of special offer banners
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colors(context).primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(banners[i],fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  itemCount: banners.length,
                ),
              ],
            ),
          ),
          // Fade shadow widget for styling
          FadeShadowWidget(),
        ],
      ),
    );
  }
}
