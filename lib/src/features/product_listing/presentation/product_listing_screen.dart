import 'package:e_commerce/src/features/product_listing/controllers/product_controller.dart';
import 'package:e_commerce/src/features/product_listing/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListing extends StatelessWidget {
  ProductListing({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'All Products',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ProductScrolling(productController: productController),
    );
  }
}

class ProductScrolling extends StatelessWidget {
  const ProductScrolling({
    Key? key,
    required this.productController,
  }) : super(key: key);

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          itemCount: productController.productList.value.length,
          itemBuilder: (context, index) =>
              ProductTile(product: productController.productList.value[index]),
        );
      }
    });
  }
}
