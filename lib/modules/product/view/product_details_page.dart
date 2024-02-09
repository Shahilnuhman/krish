import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krish/modules/cart/riverpod/cart_provider.dart';
import 'package:krish/support/common_widgets/snackBarWidget.dart';
import 'package:krish/support/constants.dart';
import 'package:krish/support/theme/theme.dart';
import 'package:krish/support/transition/transition.dart';
import 'package:krish/support/common_widgets/bottomNavigationBar.dart';
import 'package:krish/support/common_widgets/primaryButton.dart';

// ProductDetailsPage widget represents the page displaying details of a product
class ProductDetailsPage extends StatelessWidget {
  final String id; // ID of the product
  const ProductDetailsPage({super.key, required this.id});

  // Static method to create a route for navigating to this page
  static Route route({required String id}) {
    return AppFadeTransition(
        page: ProductDetailsPage(
      id: id,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Find the product from the list based on the provided ID
    Product product = products.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        // Leading icon button for navigating back
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: colors(context).primaryIcon,
          ),
        ),
        // Title of the page
        title: Text(
          product.name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: colors(context).text),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: const BottomNavigation(activeIcon: ""),
      // Body of the page
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product image
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: colors(context).primary!.withOpacity(0.2),
                ),
                child: Image.asset(product.image, height: 200),
              ),
              // Product name
              Text(product.name),
              // Product price
              Text(
                "AED ${product.price.toString()}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: colors(context).text),
              ),
              // Product description
              Text(product.description),
              const Spacer(),
              // Button to add product to cart
              Consumer(
                builder: (context,ref,child) {

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: PrimaryButton(
                      text: "Add to Cart",
                      onPressed: () {
                        ref.read(cartProvider.notifier).state.add(product.id);
                        SnackBarWidget.successSnackBar(context: context, message: "added");
                      },
                      color: colors(context).primary,
                    ),
                  );
                }
              ),
              // Button to buy the product now
              PrimaryButton(
                text: "Buy Now",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
