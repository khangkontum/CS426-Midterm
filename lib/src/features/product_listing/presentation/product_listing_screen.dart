import 'dart:js';

import 'package:e_commerce/routes/router.gr.dart';
import 'package:e_commerce/src/features/product_listing/controllers/product_controller.dart';
import 'package:e_commerce/src/features/product_listing/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_route/auto_route.dart';

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
        body: Obx(() {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: productController.productList.value.length,
                itemBuilder: (_, index) => ProductTile(
                    product: productController.productList.value[index],
                    addToCart: () => print('tmp')));
          }
        }));
  }
}
