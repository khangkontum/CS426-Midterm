import 'package:e_commerce/src/features/cart/controllers/cart.dart';
import 'package:e_commerce/src/features/cart/models/item.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
      height: 150,
      child: Flexible(
        fit: FlexFit.loose,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                width: 177,
                child: Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      item.imageLink.toString(),
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, exception, stackTrace) =>
                          Image.asset(
                        'image/error_image.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                )),
            const SizedBox(width: 21),
            Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                width: 177,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: AutoSizeText(
                        item.name.toString(),
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.subtitle2,
                        minFontSize: 18,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          AutoSizeText(
                            item.price.toString(),
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.subtitle2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AutoSizeText(
                            "\$",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodyText1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(1)),
                          child: const Icon(
                            Icons.remove,
                            size: 20,
                          ),
                          onPressed: () => removeFromCart(item),
                        ),
                        Obx(() => Text(item.quantity.value.toString())),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(1)),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                          onPressed: () => addToCart(item),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
