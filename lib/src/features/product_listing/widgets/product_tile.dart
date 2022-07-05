import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/cart/controllers/cart.dart';
import 'package:e_commerce/src/features/cart/models/item.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/features/product_listing/models/product.dart';
import 'package:get/instance_manager.dart';

class ProductTile extends StatelessWidget {
  ProductTile(
      {Key? key,
      required this.product,
      required this.moreDetail,
      required this.parentSize})
      : super(key: key);

  final Product product;
  final Size parentSize;
  final void Function() moreDetail;

  final Cart cart = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: parentSize.width,
      height: parentSize.width * .43,
      child: Row(
        children: [
          SizedBox(
              width: parentSize.width * .43,
              child: Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: GestureDetector(
                    onTap: moreDetail,
                    child: Image.network(
                      product.imageLink.toString(),
                      fit: BoxFit.fitWidth,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, exception, stackTrace) =>
                          Image.asset(
                        'image/error_image.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              )),
          SizedBox(width: parentSize.width * 0.04),
          SizedBox(
            width: parentSize.width * .4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  product.name.toString(),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    AutoSizeText(
                      product.price.toString(),
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subtitle2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AutoSizeText(
                      product.priceSign == Null
                          ? product.priceSign.toString()
                          : "\$",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        cart.addToCart(product.id.toString(), 1);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.shopping_cart_outlined,
                            ),
                            SizedBox(width: parentSize.width * 0.03),
                            const AutoSizeText("ADD TO CART")
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
