import 'dart:convert';

import 'package:e_commerce/src/features/vendors/models/vendor.dart';
import 'package:e_commerce/src/services/remote_services.dart';
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
      var response = await RemoteService.fetchVendors();
      vendorList.value = RxList.from(response!.toList());
    } finally {
      isLoading.value = false;
    }
  }
}
