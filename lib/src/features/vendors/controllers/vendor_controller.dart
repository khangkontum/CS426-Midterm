import 'dart:convert';

import 'package:e_commerce/src/features/vendors/models/vendor.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/services.dart' show rootBundle;

class VendorController extends GetxController {
  var isLoading = true.obs;
  var vendorList = RxList<Vendor>().obs;

  @override
  void onInit() {
    super.onInit();
    loadVendor();
  }

  void loadVendor() async {
    try {
      isLoading.value = true;
      var response = await rootBundle.loadString('data/vendor.json');
      var data = json.decode(response);
      for (var vendor in data) {
        vendorList.value.add(Vendor(
            name: vendor["name"],
            imageLink: vendor["imageLink"],
            address: vendor["address"]));
      }
    } finally {
      isLoading.value = false;
    }
  }
}
