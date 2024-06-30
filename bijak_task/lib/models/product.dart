// models/product.dart
class Product {
  final String name;
  final String weight;
  final double price;
  final String imageUrl;

  Product(
      {required this.name,
      required this.weight,
      required this.price,
      required this.imageUrl});
}
