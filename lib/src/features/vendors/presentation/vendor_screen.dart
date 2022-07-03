import 'package:e_commerce/src/features/vendors/controllers/vendor_controller.dart';
import 'package:e_commerce/src/features/vendors/widgets/vendor_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorScreen extends StatelessWidget {
  VendorScreen({Key? key}) : super(key: key);

  final VendorController vendorController = Get.put(VendorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          title: Text(
            'Vendors',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
      body: Obx(() {
        if (vendorController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          Size size = MediaQuery.of(context).size;
          return Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: size.width / 2,
                      // childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: vendorController.vendorList.value.length,
                  itemBuilder: (_, index) => VendorTile(
                      vendor: vendorController.vendorList.value[index])));
        }
      }),
    );
  }
}
