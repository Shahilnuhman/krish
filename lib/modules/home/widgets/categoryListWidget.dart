import 'package:flutter/material.dart';
import 'package:krish/modules/category/view/category_listing_page.dart';
import 'package:krish/support/constants.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      children: List.generate(categoryList.length, (index) {
        return InkWell(
          onTap: (){
            Navigator.push(context, CategoryListPage.route(title: categoryList[index].name));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Image.asset(
                  categoryList[index].icon,
                  fit: BoxFit.fill,
                  height: 40,
                ),
                Text(categoryList[index].name)
              ],
            ),
          ),
        );
      }),
    );
  }
}