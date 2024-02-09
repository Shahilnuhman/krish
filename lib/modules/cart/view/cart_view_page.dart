import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krish/modules/cart/riverpod/cart_provider.dart';
import 'package:krish/modules/home/view/homeScreenPage.dart';
import 'package:krish/support/constants.dart';
import 'package:krish/support/theme/theme.dart';
import 'package:krish/support/transition/transition.dart';
import 'package:krish/support/common_widgets/bottomNavigationBar.dart';
import 'package:krish/support/common_widgets/primaryButton.dart';
import 'package:lottie/lottie.dart';

// CartPage widget represents the page where the user's cart items are displayed
class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  // Static method to create a route for navigating to this page
  static Route route() {
    return AppFadeTransition(page: const CartPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your orders",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: colors(context).text)),
      ),
      bottomNavigationBar: const BottomNavigation(activeIcon: ""),
      body: ref.watch(cartProvider.notifier).state.isEmpty
          ? Center(
              child: Column(
                children: [
                  // Lottie animation for empty cart
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Lottie.asset(
                      'assets/images/cartLottie.json',
                      height: 300,
                      repeat: true,
                    ),
                  ),
                  const Text("Your Cart is empty",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  // Button to continue shopping, navigates to the home screen
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 50),
                    child: PrimaryButton(
                      text: "Continue Shopping",
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context, HomeScreenPage.route(), (route) => false);
                      },
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(children: [
                    Image.asset(
                      products
                          .firstWhere((element) =>
                              element.id ==
                              ref.watch(cartProvider.notifier).state[i])
                          .image,
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(products
                              .firstWhere((element) =>
                                  element.id ==
                                  ref.watch(cartProvider.notifier).state[i])
                              .name,overflow: TextOverflow.ellipsis,),
                          Text(
                              " AED ${products.firstWhere((element) => element.id == ref.watch(cartProvider.notifier).state[i]).price.toString()}")
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          ref.watch(cartProvider.notifier).state.removeWhere(
                              (element) =>
                                  element ==
                                  ref.watch(cartProvider.notifier).state[i]);
                        },
                        child: Icon(Icons.remove_circle))
                  ]),
                  // height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colors(context).white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              itemCount: ref.watch(cartProvider.notifier).state.length,
            ),
    );
  }
}
