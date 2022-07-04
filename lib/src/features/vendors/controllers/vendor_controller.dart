import 'dart:convert';

import 'package:e_commerce/src/features/vendors/models/vendor.dart';
import 'package:e_commerce/src/services/remote_services.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:e_commerce/src/features/product_listing/models/product.dart';

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
      if (response == null) return;
      vendorList.value = RxList.from(response!.toList());
    } finally {
      isLoading.value = false;
    }
  }
}

class IndividualVendor extends GetxController {
  IndividualVendor({required this.vendorId});

  var isLoading = true.obs;
  var vendorInfo;
  final vendorId;
  var productList = RxList<Product>().obs;

  @override
  void onInit() async {
    super.onInit();
    fetchVendor(vendorId);
  }

  void fetchVendor(vendorId) async {
    try {
      isLoading.value = true;
      var response = await RemoteService.fetchVendor(vendorId);
      if (response == null) return;
      productList.value =
          RxList.from(productFromVendorJson(response.toString()).toList());
      vendorInfo = Vendor.fromJson(json.decode(response.toString())['store']);
    } finally {
      isLoading.value = false;
    }
  }
}
