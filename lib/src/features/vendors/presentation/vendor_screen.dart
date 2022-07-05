import 'package:e_commerce/src/features/vendors/controllers/vendor_controller.dart';
import 'package:e_commerce/src/features/vendors/models/vendor.dart';
import 'package:e_commerce/src/features/vendors/widgets/vendor_tile.dart';
import 'package:e_commerce/src/shared/image_network.dart';
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
        child: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20),
                    AutoSizeText(
                      "Vendors",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10)),
                      onPressed: () {
                        if (vendorController.isLoading.value == false) {
                          context.router.push(const MapScreen());
                        }
                      },
                      child: const Icon(
                        Icons.map,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
                vendor: vendorController.vendorList.value[index],
                onTap: () => showModalBottomSheet(
                    // enableDrag: false,
                    // isDismissible: false,
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => VendorInfo(
                          vendorInf: vendorController.vendorList.value[index],
                        )),
              ),
            ),
          );
        }
      }),
    );
  }
}

class VendorInfo extends StatelessWidget {
  const VendorInfo({Key? key, required this.vendorInf}) : super(key: key);

  final Vendor vendorInf;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.7,
        minChildSize: 0.2,
        builder: (_, controller) => Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 23,
                horizontal: 20,
              ),
              child: ListView(
                controller: controller,
                children: [
                  VendorLogo(size: size, vendorInf: vendorInf),
                  const SizedBox(height: 29),
                  AutoSizeText(
                    vendorInf.description,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: const Color(0xFF9586A8),
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      context.router.push(VendorDetailScreen(
                          vendorId: vendorInf.id.toString()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 16),
                            child: AutoSizeText("SEE ALL PRODUCTS"))
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}

class VendorLogo extends StatelessWidget {
  const VendorLogo({
    Key? key,
    required this.size,
    required this.vendorInf,
  }) : super(key: key);

  final Size size;
  final Vendor vendorInf;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.09,
          child: ImageNetwork(imageLink: vendorInf.imageLink),
        ),
        const SizedBox(width: 13),
        AutoSizeText(
          vendorInf.name,
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }
}
