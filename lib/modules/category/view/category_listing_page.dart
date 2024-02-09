import 'package:flutter/material.dart';
import 'package:krish/modules/home/widgets/productListWidget.dart';
import 'package:krish/modules/home/widgets/searchBarWidget.dart';
import 'package:krish/support/theme/theme.dart';
import 'package:krish/support/transition/transition.dart';
import 'package:krish/support/common_widgets/bottomNavigationBar.dart';
import 'package:krish/support/common_widgets/fadeShadowWidget.dart';

// CategoryListPage widget represents the page where products of a specific category are displayed
class CategoryListPage extends StatelessWidget {
  // Title of the category
  final String title;
  
  // Constructor
  const CategoryListPage({super.key, required this.title});

  // Static method to create a route for navigating to this page
  static Route route({required String title}) {
    return AppFadeTransition(
      page: CategoryListPage(
        title: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors(context).primary,
        // Back button
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
        // Title of the page
        title: Text(
          "${title} Products",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: colors(context).white
          )
        ),
        // Search bar widget placed at the bottom of the app bar
        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SearchBarWidget(onTap: (){},),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: const BottomNavigation(activeIcon: ""),
      // Body of the page
      body: Stack(
        children: [
          // List of products
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  // Product list widget
                  ProductListWidget(),
                  ProductListWidget(),
                ],
              ),
            ),
          ),
          // Fade shadow widget for styling
          FadeShadowWidget(),
        ],
      ),
    );
  }
}
