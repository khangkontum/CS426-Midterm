import 'package:e_commerce/src/features/vendors/controllers/vendor_controller.dart';
import 'package:e_commerce/src/features/vendors/widgets/vendor_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/routes/router.gr.dart';

class VendorScreen extends StatelessWidget {
  VendorScreen({Key? key}) : super(key: key);

  final VendorController vendorController = Get.put(VendorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Vendors",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10)),
                child: const Icon(
                  Icons.map,
                  size: 20,
                ),
                onPressed: () => context.router.push(MapScreen()),
              ),
            ],
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
