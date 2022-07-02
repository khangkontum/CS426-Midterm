import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/features/product_listing/models/product.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () => context.router.pop(),
            icon: Icon(Icons.back_hand),
          ),
        )
      ]),
    );
  }
}
