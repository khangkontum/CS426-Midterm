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
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20),
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
      ),
      body: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              floating: true,
              snap: true,
              flexibleSpace: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: TextField(
                    controller: searchController,
                    onSubmitted: (String value) {
                      productController.reload(value);
                    },
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: 'Looking for product?',
                        labelText: 'Search',
                        prefixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              productController.reload(searchController.text);
                            }),
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              if (searchController.text != '') {
                                searchController.clear();
                                productController.reload(null);
                              }
                            })),
                  ),
                ),
              ),
            ),
          ],
          body: Obx(() {
            if (productController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 40, left: 20, right: 20),
                child: LazyLoadScrollView(
                  onEndOfPage: () => {},
                  child: ListView.builder(
                      itemCount: productController.productList.value.length,
                      itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: ProductTile(
                                product:
                                    productController.productList.value[index],
                                parentSize: MediaQuery.of(context).size,
                                moreDetail: () => context.router.push(
                                      ProductDetail(
                                        product: productController
                                            .productList.value[index],
                                      ),
                                    )),
                          )),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
