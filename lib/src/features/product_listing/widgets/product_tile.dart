import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/cart/controllers/cart.dart';
import 'package:e_commerce/src/features/cart/models/item.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/features/product_listing/models/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
    required this.moreDetail,
  }) : super(key: key);

  final Product product;
  final void Function() moreDetail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        height: 150,
        child: Flexible(
          fit: FlexFit.loose,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                  width: size.width * .43,
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
                                value: loadingProgress.expectedTotalBytes !=
                                        null
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
              const SizedBox(width: 21),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AutoSizeText(
                      product.name.toString(),
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subtitle2,
                      minFontSize: 18,
                      maxLines: 1,
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
                          onPressed: () => addToCart(itemFromProduct(product)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                ),
                                SizedBox(width: 17.43),
                                AutoSizeText("ADD TO CART")
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
        ),
      ),
    );
  }
}
