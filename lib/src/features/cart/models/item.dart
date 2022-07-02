import 'package:e_commerce/src/features/product_listing/models/product.dart';
import 'package:get/state_manager.dart';

class Item {
  Item({
    this.id,
    this.name,
    this.price,
    this.imageLink,
  });

  // void increment() => quantity++;

  var quantity = 1.obs;
  String? name;
  String? imageLink;
  int? id;
  double? price;
}

Item itemFromProduct(Product? prod) {
  Item it = Item();
  if (prod!.name != Null) it.name = prod!.name;
  if (prod!.id != Null) it.id = prod!.id;
  if (prod!.imageLink != Null) it.imageLink = prod.imageLink;
  if (prod!.price != Null) it.price = double.parse(prod.price.toString());
  return it;
}
