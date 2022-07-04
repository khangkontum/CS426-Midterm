import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/vendors/controllers/vendor_controller.dart';
import 'package:e_commerce/src/features/vendors/models/vendor.dart';
import 'package:e_commerce/src/shared/image_network.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';
import 'package:e_commerce/routes/router.gr.dart';

import 'package:e_commerce/src/features/product_listing/widgets/product_tile.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class VendorDetailScreen extends StatefulWidget {
  VendorDetailScreen({
    Key? key,
    required this.vendorId,
  }) : super(key: key);

  final String vendorId;

  @override
  State<VendorDetailScreen> createState() => _VendorDetailScreenState();
}

class _VendorDetailScreenState extends State<VendorDetailScreen> {
  late IndividualVendor _individualVendor;

  @override
  void initState() {
    super.initState();
    _individualVendor = Get.put(IndividualVendor(vendorId: widget.vendorId));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //         shape: const CircleBorder(), padding: const EdgeInsets.all(2)),
        //     child: const Icon(
        //       Icons.arrow_back,
        //       size: 30,
        //     ),
        //     onPressed: () => context.router.pop(),
        //   ),
        // ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                const SizedBox(width: 20),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() {
                        if (_individualVendor.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                VendorLogo(
                                  size: size,
                                  vendorInf: _individualVendor.vendorInfo,
                                )
                              ],
                            ),
                          );
                        }
                      })
                    ]),
              ],
            ),
          ),
        ),
        body: Obx(() {
          if (_individualVendor.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SizedBox(
                width: size.width,
                child: LazyLoadScrollView(
                  onEndOfPage: () => {},
                  child: ListView.builder(
                      itemCount: _individualVendor.productList.value.length,
                      itemBuilder: (_, index) => ProductTile(
                          product: _individualVendor.productList.value[index],
                          moreDetail: () => context.router.push(
                                ProductDetail(
                                  product: _individualVendor
                                      .productList.value[index],
                                ),
                              ))),
                ));
          }
        }));
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key, required this.vendorId}) : super(key: key);
  final String vendorId;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
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
      children: [
        const SizedBox(width: 20),
        SizedBox(
          width: size.width * 1 / 4,
          child: ImageNetwork(imageLink: vendorInf.imageLink),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              vendorInf.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            AutoSizeText("All Products",
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: const Color(0xFF9586A8),
                    fontWeight: FontWeight.w400))
          ],
        )
      ],
    );
  }
}
