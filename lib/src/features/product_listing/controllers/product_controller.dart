import 'package:e_commerce/src/services/remote_services.dart';
import 'package:get/state_manager.dart';

import '../models/product.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = RxList<Product>().obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    try {
      isLoading.value = true;
      var products = await RemoteService.fetchProducts();
      if (products != null) {
        productList.value = RxList.from(products.reversed.toList());
      }
    } finally {
      isLoading.value = false;
    }
  }
}
