import 'dart:html';

import 'package:e_commerce/src/features/product_listing/models/product.dart';
import 'package:e_commerce/src/features/user/models/user.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client
        .get(Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json'));
    if (response.statusCode == true) {
      var jsonData = response.body;
      // print('before jsonData');
      // print(jsonData);
      // print('after json data');
      return productFromJson(jsonData);
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
    var jsonData = json.decode(response.body);
    if (jsonData['success'] == true) {
      return jsonData['token'];
    } else {
      return null;
    }
  }

  static Future<User?> authUser(token) async {
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
      return User.fromJson(jsonData);
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
        'username': user.username,
        'password': user.password.toString(),
        'email': user.email,
        'address': user.address,
        'name': user.fullname
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
