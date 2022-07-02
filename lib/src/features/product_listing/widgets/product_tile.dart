import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/features/product_listing/models/product.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 128,
        child: Row(
          children: [
            const Expanded(flex: 483, child: SizedBox()),
            Expanded(
                flex: 4759,
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Image.network(
                    product.imageLink.toString(),
                    fit: BoxFit.cover,
                    errorBuilder: (context, exception, stackTrace) =>
                        Image.asset(
                      'image/error_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            const Expanded(
              flex: 4758,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
