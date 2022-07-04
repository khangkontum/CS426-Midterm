import 'package:e_commerce/src/features/product_listing/models/product.dart';
import 'package:e_commerce/src/features/user/models/user.dart';
import 'package:e_commerce/src/features/vendors/models/vendor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    try {
      var url = dotenv.env["PREFIX"].toString() + '/products';
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = response.body;

        return productFromJson(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<List<Vendor>?> fetchVendors() async {
    try {
      var url = dotenv.env["PREFIX"].toString() + '/stores';
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        return vendorFromJson(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<List<Vendor>?> fetchVendor(String vendorId) async {
    try {
      var url = dotenv.env["PREFIX"].toString() + '/stores/' + vendorId;
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        return vendorFromJson(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<String?> requestLogIn(username, password) async {
    try {
      var url = dotenv.env["PREFIX"].toString() + "/auth/login";
      var response = await client.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<String?> authUser() async {
    try {
      var token = await _getToken();
      if (token == null) return null;
      var url = dotenv.env["PREFIX"].toString() + "/auth/info";
      var response = await client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<String?> requestSignUp(User user) async {
    try {
      var url = dotenv.env["PREFIX"].toString() + "/auth/signup";
      var response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'username': user.username.toString(),
          'password': user.password.toString(),
          'email': user.email.toString(),
          'phone': user.phone.toString(),
          'name': user.fullname.toString()
        }),
      );
      var jsonData = json.decode(response.body);
      if (jsonData['success'] == true) {
        return jsonData['token'];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<String?> addToCart(productId, quantity) async {
    try {
      var url = dotenv.env["PREFIX"].toString() + "/carts/add";
      var token = await _getToken();
      if (token == null) return null;
      var response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(
          <String, String>{
            'productId': productId.toString(),
            'quantity': quantity.toString(),
          },
        ),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

Future<String?> _getToken() async {
  FlutterSecureStorage storage = Get.find();
  var token = await storage.read(key: "jwt");
  if (token == null) return null;
  return token;
}
