import 'dart:convert';

import 'package:e_commerce/src/features/product_listing/models/product.dart';
import 'package:e_commerce/src/services/remote_services.dart';

import '../models/item.dart';
import 'package:get/get.dart';

class Cart extends GetxController {
  var productList = RxList<Product>().obs;
  var totalItem = 0.obs;
  var totalValue = 0.0.obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    fetch();
  }

  void reload() {
    totalValue.value = 0;
    totalItem.value = 0;
    for (Product product in productList.value) {
      totalItem += product.quantity;
      totalValue.value +=
          double.parse(product.price.toString()) * product.quantity;
    }

    isLoading.value = false;
  }

  void fetch() async {
    try {
      isLoading.value = true;
      var response = await RemoteService.fetchCart();
      if (response == null) return;
      productList.value =
          RxList.from(productFromCartJson(response.toString()).toList());
    } finally {
      reload();
    }
  }

  void confirmCart() {
    productList.value.clear();
    totalItem.value = 0;
    totalValue.value = 0;
    RemoteService.deleteCart();
  }

  void addToCart(String productId, int quantity) async {
    try {
      isLoading.value = true;
      productList.value.clear();
      totalItem.value = 0;
      totalValue.value = 0;

      var response = await RemoteService.addToCart(productId, quantity);
      if (response == null) return;
      productList.value =
          RxList.from(productFromCartJson(response.toString()).toList());
    } finally {
      reload();
    }
  }

  void removeFromCart(String productId, int quantity) async {
    try {
      isLoading.value = true;
      productList.value.clear();
      totalItem.value = 0;
      totalValue.value = 0;

      var response = await RemoteService.removeFromCart(productId, quantity);
      if (response == null) return;
      productList.value =
          RxList.from(productFromCartJson(response.toString()).toList());
    } finally {
      reload();
    }
  }
}
