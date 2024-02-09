import 'package:flutter/material.dart';
import 'package:krish/modules/product/view/product_details_page.dart';
import 'package:krish/support/constants.dart';
import 'package:krish/support/theme/theme.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(products.length, (index) {
        return InkWell(
          onTap: (){
            Navigator.push(context, ProductDetailsPage.route(id: products[index].id));
          },
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: colors(context).primary!.withOpacity(0.2),
                  ),
                  child: Image.asset(
                    products[index].image,
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
                Text(
                  products[index].name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text("AED ${products[index].price}",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        );
      }),
    );
  }
}