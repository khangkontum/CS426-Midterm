import 'package:e_commerce/src/features/product_listing/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client
        .get(Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      // print('before jsonData');
      // print(jsonData);
      // print('after json data');
      return productFromJson(jsonData);
    } else {
      return null;
    }
  }
}
