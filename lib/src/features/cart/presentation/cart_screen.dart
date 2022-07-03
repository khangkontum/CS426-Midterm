import 'package:e_commerce/src/features/cart/controllers/cart.dart';
import 'package:e_commerce/src/features/cart/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final Cart cart = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Obx(() {
          if (cart.totalItem.value == 0) {
            return const Center(
              child: Text('Your Cart Is Empty'),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  flex: 92,
                  child: ListView.builder(
                      itemCount: cart.itemList.value.length,
                      itemBuilder: (_, index) =>
                          ItemTile(item: cart.itemList.value[index])),
                ),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .2,
                    child: Row(
                      children: [
                        const SizedBox(width: 70),
                        Expanded(
                          child: Row(
                            children: [
                              Obx(
                                () => AutoSizeText(
                                  cart.totalValue.value.toStringAsFixed(2),
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ),
                              const AutoSizeText("\$"),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          height: 52,
                          child: ElevatedButton(
                              onPressed: () => confirmCart(),
                              child: const AutoSizeText("CONFIRM CART")),
                        ),
                        const SizedBox(width: 34),
                      ],
                    ),
                  ),
                )
              ],
            );
            //   (
            //     height: Material.of(context).si,
            //   ) Column(children: [
            //     // Expanded(
            //     //   child: ListView.builder(
            //     //       itemCount: cart.itemList.value.length,
            //     //       itemBuilder: (_, index) =>
            //     //           ItemTile(item: cart.itemList.value[index])),
            //     // ),
            //     Align(
            //       alignment: Alignment.bottomCenter,
            //       child: Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.black,
            //       ),
            //     )
            //   ]);
          }
        }));
  }
}
