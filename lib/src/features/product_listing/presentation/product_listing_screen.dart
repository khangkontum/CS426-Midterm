import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/routes/router.gr.dart';
import 'package:e_commerce/src/features/product_listing/controllers/product_controller.dart';
import 'package:e_commerce/src/features/product_listing/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_route/auto_route.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ProductListing extends StatefulWidget {
  const ProductListing({Key? key}) : super(key: key);

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "All Products",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Obx(() {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return LazyLoadScrollView(
              onEndOfPage: () => {},
              child: ListView.builder(
                  itemCount: productController.productList.value.length,
                  itemBuilder: (_, index) => ProductTile(
                      product: productController.productList.value[index],
                      moreDetail: () => context.router.push(
                            ProductDetail(
                              product:
                                  productController.productList.value[index],
                            ),
                          ))),
            );
          }
        }));
  }
}
