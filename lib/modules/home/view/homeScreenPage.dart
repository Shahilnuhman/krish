import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krish/modules/cart/riverpod/cart_provider.dart';
import 'package:krish/modules/cart/view/cart_view_page.dart';
import 'package:krish/modules/home/riverpod/appThemeProvider.dart';
import 'package:krish/modules/home/widgets/carouselWidget.dart';
import 'package:krish/modules/home/widgets/categoryListWidget.dart';
import 'package:krish/modules/home/widgets/productListWidget.dart';
import 'package:krish/modules/home/widgets/searchBarWidget.dart';
import 'package:krish/modules/search/view/search_page.dart';
import 'package:krish/support/constants.dart';
import 'package:krish/support/theme/theme.dart';
import 'package:krish/support/transition/transition.dart';
import 'package:krish/support/common_widgets/bottomNavigationBar.dart';
import 'package:krish/support/common_widgets/dotIndicator.dart';
import 'package:badges/badges.dart' as badges;
import 'package:krish/support/common_widgets/fadeShadowWidget.dart';

// HomeScreenPage widget represents the main home screen of the app
class HomeScreenPage extends ConsumerWidget {
  const HomeScreenPage({super.key});

  // Static method to create a route for navigating to this page
  static Route route() {
    return AppFadeTransition(page: const HomeScreenPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch for changes in the app theme
    final isDarkMode = ref.watch(appThemeProvider);
    // ValueNotifier to keep track of the current page index for the carousel
    ValueNotifier<int> pageIndex = ValueNotifier(0);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          // Leading icon button for user profile
          leading:Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.person, color: Colors.white,
                size: 24,),
            ),
          ),
          centerTitle: true,
          backgroundColor: colors(context).primary,
          // App logo in the title
          title: SizedBox(
            width: 50,
            child: Image.asset("assets/images/image.png"),
          ),
          // Actions in the app bar
          actions: [
            // Toggle dark mode button
            IconButton(
              onPressed: () {
                ref.read(appThemeProvider.notifier).state = !isDarkMode;
              },
              icon: isDarkMode
                  ? const Icon(
                      Icons.sunny,
                      color: Colors.amber,
                    )
                  : const Icon(
                      Icons.dark_mode,
                      color: Colors.white,
                    ),
            ),
            // Cart icon button with badge
            Consumer(
              builder: (context,ref,child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -10, end: 0),
                    badgeContent: Text(ref.watch(cartProvider.notifier).state.length.toString()),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, CartPage.route());
                      },
                      icon: Icon(Icons.shopping_cart_rounded),
                      color: Colors.white,
                      iconSize: 24,
                    ),
                  ),
                );
              }
            ),
          ],
          // Search bar widget at the bottom of the app bar
          bottom:  PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: SearchBarWidget(onTap: (){
              Navigator.push(context, SearchPage.route());
            }),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(activeIcon: "home"),
      // Main body of the home screen
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section title: Best Deals
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Best Deals",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  // Carousel widget for displaying banners
                  CarouselWidget(pageIndex: pageIndex),
                  // Indicator dots for the carousel
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: ValueListenableBuilder(
                        valueListenable: pageIndex,
                        builder: (context, val, child) {
                          return DotIndicator(
                            pageIndex: pageIndex.value,
                            height: 8,
                            width: 8,
                            length: banners.length,
                          );
                        },
                      ),
                    ),
                  ),
                  // Section title: Categories
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Categories",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  // Category list widget
                  const CategoryListWidget(),
                  // Section title: Products you may like
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Products you may like",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  // Product list widget
                  const ProductListWidget()
                ],
              ),
            ),
          ),
          // Fade shadow widget for styling
          const FadeShadowWidget()
        ],
      ),
    );
  }
}
