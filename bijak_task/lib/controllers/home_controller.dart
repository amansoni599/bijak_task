// controllers/home_controller.dart
import 'package:bijak_task/models/product.dart';
import 'package:bijak_task/services/product_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 5));
    products.value = ProductService().fetchProducts();
    isLoading.value = false;
  }
}
