import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/cart/controllers/cart.dart';
import 'package:e_commerce/src/features/cart/models/item.dart';
import 'package:e_commerce/src/shared/image_network.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/features/product_listing/models/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, this.product}) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //         shape: const CircleBorder(), padding: const EdgeInsets.all(2)),
        //     child: const Icon(
        //       Icons.arrow_back,
        //       size: 30,
        //     ),
        //     onPressed: () => context.router.pop(),
        //   ),
        // ),
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
            const SizedBox(height: 70),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(47, 0, 47, 13),
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
