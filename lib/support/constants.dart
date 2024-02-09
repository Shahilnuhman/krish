List<String> banners = [
  "assets/images/banner1.jpeg",
  "assets/images/banner2.jpeg",
  "assets/images/banner3.jpeg"
];

List<Product> products = [
  Product(
      "1", "WIVIA world cup football ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "assets/images/product1.png", 10.5),
  Product("2", "One plus BUds Z2", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "assets/images/product2.png", 395),
  Product(
      "3", "Diesal analogue black dial watch", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "assets/images/pr3.png", 15),
  Product("4", "HSR winter warm leggings", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "assets/images/pr4.png", 125),
  Product(
      "5", "Puma Men's Dazzler Sneakers", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "assets/images/pr5.png", 10.5),
  Product("6", "Crompton Galaxy DEcoration Bulb", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "assets/images/pr6.png",
      10.5),
];

List<Category> categoryList = [
  Category("1", "Sports", "assets/icons/sports.png"),
  Category("2", "Electronics", "assets/icons/device.png"),
  Category("3", "Fashion", "assets/icons/dress.png"),
  Category("4","Food","assets/icons/food.png" ),
  Category("5","ooks","assets/icons/books.png" ),


];

class Product {
  String id;
  String name;
  String description;
  String image;
  double price;

  Product(
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
  );
}

class Category {
  String id;
  String name;
  String icon;

  Category(
    this.id,
    this.name,
    this.icon,
  );
}
