import 'package:e_commerce/src/services/remote_services.dart';
import 'package:get/state_manager.dart';

import '../models/product.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = RxList<Product>().obs;

  @override
  void onInit() {
    super.onInit();
    fetch(null);
  }

  void reload(String? query) {
    productList.value.clear();
    fetch(query);
  }

  void fetch(String? query) async {
    try {
      isLoading.value = true;
      var products = await RemoteService.fetchProducts(query);
      if (products != null) {
        productList.value = RxList.from(products.toList());
      }
    } finally {
      isLoading.value = false;
    }
  }
}
