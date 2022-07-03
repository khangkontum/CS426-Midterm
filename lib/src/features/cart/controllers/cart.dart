import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';

import '../models/item.dart';
import 'package:get/get.dart';

void confirmCart() {
  final Cart cart = Get.find();
  cart.itemList.value.clear();
  cart.totalItem.value = 0;
  cart.totalValue.value = 0;
}

void addToCart(Item item) {
  final Cart cart = Get.find();
  cart.totalItem.value += 1;
  cart.totalValue.value += double.parse(item.price.toString());
  for (int it = 0; it < cart.itemList.value.length; it++) {
    if (cart.itemList.value[it].id == item.id) {
      cart.itemList.value[it].quantity.value++;
      return;
    }
  }
  cart.insertItem(item);
}

class Cart extends GetxController {
  var itemList = RxList<Item>().obs;
  var totalItem = 0.obs;
  var totalValue = 0.0.obs;

  void insertItem(Item item) {
    itemList.value.add(item);
    update();
  }
}

void removeFromCart(Item item) {
  final Cart cart = Get.find();
  for (int it = 0; it < cart.itemList.value.length; it++) {
    if (cart.itemList.value[it].id == item.id) {
      cart.itemList.value[it].quantity--;
      cart.totalItem.value--;
      if (cart.itemList.value[it].quantity == 0)
        cart.itemList.value.remove(item);
      return;
    }
  }
}
