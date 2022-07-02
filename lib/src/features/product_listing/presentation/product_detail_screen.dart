import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/cart/controllers/cart.dart';
import 'package:e_commerce/src/features/cart/models/item.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/features/product_listing/models/product.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key, this.product}) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.router.pop(),
            color: Colors.black,
          ),
        ),
        body: Body(
          product: product,
        ));
  }
}

class Body extends StatelessWidget {
  Body({Key? key, this.product}) : super(key: key);
  Product? product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .6,
          child: Image.network(
            product!.imageLink.toString(),
            fit: BoxFit.cover,
            errorBuilder: (context, exception, stackTrace) => Image.asset(
              'image/error_image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: AutoSizeText(
                        product!.name.toString(),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          AutoSizeText(
                            product!.price.toString(),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          AutoSizeText(
                            product!.priceSign == Null
                                ? product!.priceSign.toString()
                                : "\$",
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 51),
                    Align(
                      alignment: Alignment.topLeft,
                      child: AutoSizeText(
                        product!.description.toString(),
                        maxLines: 10,
                      ),
                    ),
                    const Spacer(),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 266,
                              height: 52,
                              child: ElevatedButton(
                                onPressed: () =>
                                    addToCart(itemFromProduct(product)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
