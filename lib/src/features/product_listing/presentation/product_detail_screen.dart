import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/cart/controllers/cart.dart';
import 'package:e_commerce/src/features/cart/models/item.dart';
import 'package:e_commerce/src/shared/image_network.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/features/product_listing/models/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, this.product}) : super(key: key);

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
        body: DetailBody(
          product: product,
        ));
  }
}

class DetailBody extends StatelessWidget {
  DetailBody({Key? key, required this.product}) : super(key: key);
  Product? product;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(47, 0, 47, 13),
                  child: SizedBox(
                      height: size.width * .77,
                      width: size.width * .77,
                      child: ImageNetwork(
                          imageLink: product!.imageLink.toString())),
                ),
                AutoSizeText(
                  product!.name.toString(),
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      product!.price.toString(),
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                    AutoSizeText(
                      '\$',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: const Color(0xFF9586A8)),
                    )
                  ],
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(24),
                child: AutoSizeText(product!.description.toString(),
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF9586A8)))),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 266,
                  height: 52,
                  child: AddToCartButton(product: product),
                )
              ],
            )
          ],
        ),
      ),
    );
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
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Image.network(
              product!.imageLink.toString(),
              fit: BoxFit.fitWidth,
              errorBuilder: (context, exception, stackTrace) => Image.asset(
                'image/error_image.png',
                fit: BoxFit.cover,
              ),
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
                              child: AddToCartButton(product: product),
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

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => addToCart(itemFromProduct(product)),
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
    );
  }
}
