// services/product_service.dart
import 'package:bijak_task/models/product.dart';

class ProductService {
  List<Product> fetchProducts() {
    return [
      Product(
        name: 'Mango',
        weight: '1kg',
        price: 5.0,
        imageUrl: 'https://picsum.photos/200/300/?image=42',
      ),
      Product(
        name: 'Banana',
        weight: '1kg (approx. 5-6 bananas)',
        price: 2.5,
        imageUrl: 'https://picsum.photos/200/300/?image=87',
      ),
      Product(
        name: 'Watermelon',
        weight: 'Whole (weight varies)',
        price: 8.0,
        imageUrl: 'https://picsum.photos/200/300/?image=93',
      ),
      Product(
        name: 'Strawberries',
        weight: '250g',
        price: 4.0,
        imageUrl: 'https://picsum.photos/200/300/?image=102',
      ),
      Product(
        name: 'Grapes',
        weight: '500g',
        price: 6.0,
        imageUrl: 'https://picsum.photos/200/300/?image=121',
      ),
      // Add more products here
    ];
  }
}
