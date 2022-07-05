import 'package:e_commerce/src/features/map/models/marker.dart';
import 'package:e_commerce/src/features/vendors/controllers/vendor_controller.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  var isLoading = true.obs;
  late List<StoreMaker> makerList;

  @override
  void onInit() {
    super.onInit();
    fetchFromVendorController();
  }

  void fetchFromVendorController() async {
    try {
      isLoading.value = true;
      VendorController vendorController = Get.find();
      makerList = vendorController.vendorList.value
          .map((vendor) => StoreMaker.fromVendor(vendor))
          .toList();
    } finally {
      isLoading.value = false;
    }
  }
}
