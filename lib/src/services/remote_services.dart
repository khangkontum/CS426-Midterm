import 'package:e_commerce/src/features/product_listing/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client
        .get(Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      var tmp = productFromJson(jsonData);
      // print('before jsonData');
      // print(jsonData);
      // print('after json data');
      for (var prod in tmp) {
        print(prod.name);
      }
      return productFromJson(jsonData);
    } else {
      return null;
    }
  }
}
