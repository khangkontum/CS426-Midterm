import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/cart/controllers/cart.dart';
import 'package:e_commerce/src/features/cart/models/item.dart';
import 'package:e_commerce/src/shared/image_network.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/features/product_listing/models/product.dart';

class VendorDetailScreen extends StatelessWidget {
  const VendorDetailScreen({
    Key? key,
    required this.vendorId,
  }) : super(key: key);

  final String vendorId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), padding: const EdgeInsets.all(2)),
            child: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () => context.router.pop(),
          ),
        ),
        body: DetailBody(
          vendorId: vendorId,
        ));
  }
}

class DetailBody extends StatelessWidget {
  DetailBody({Key? key, required this.vendorId}) : super(key: key);
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
