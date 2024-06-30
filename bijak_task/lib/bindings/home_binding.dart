// bindings/home_binding.dart
import 'package:bijak_task/controllers/home_controller.dart';
import 'package:bijak_task/services/product_service.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProductService>(() => ProductService());
  }
}
