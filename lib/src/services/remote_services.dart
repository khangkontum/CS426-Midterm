import 'package:e_commerce/src/features/product_listing/models/product.dart';
import 'package:e_commerce/src/features/user/controllers/user_controller.dart';
import 'package:e_commerce/src/features/user/models/user.dart';
import 'package:e_commerce/src/features/vendors/models/vendor.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var url = dotenv.env["PREFIX"].toString() + '/products';
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = response.body;

      return productFromJson(jsonData);
    } else {
      return null;
    }
  }

  static Future<List<Vendor>?> fetchVendors() async {
    var url = dotenv.env["PREFIX"].toString() + '/stores';
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return vendorFromJson(jsonData);
    } else {
      return null;
    }
  }

  static Future<String?> requestLogIn(username, password) async {
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
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      return null;
    }
  }

  static Future<JsonCodec?> authUser(token) async {
    var url = dotenv.env["PREFIX"].toString() + "/auth/info";
    var response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    var jsonData = json.decode(response.body);
    if (jsonData['success'] == true) {
      return jsonData;
    } else {
      return null;
    }
  }

  static Future<String?> requestSignUp(User user) async {
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
  }
}
