// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

List<Product> productFromJson(String str) => List<Product>.from(
    json.decode(str)['products'].map((x) => Product.fromJson(x)));
List<Product> productFromVendorJson(String str) => List<Product>.from(
    json.decode(str)['store']['products'].map((x) => Product.fromJson(x)));
List<Product> productFromCartJson(String str) => List<Product>.from(
    json.decode(str)['cart']['products'].map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.brand,
    this.name,
    this.price,
    required this.quantity,
    this.priceSign,
    this.currency,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.category,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
  });

  int? id;
  String? brand;
  String? name;
  String? price;
  int quantity;
  dynamic priceSign;
  dynamic currency;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  String? category;
  String? productType;
  List<dynamic>? tagList;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProductColor>? productColors;

  var isFavorite = false.obs;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        brand: json["brand"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        priceSign: json["price_sign"],
        currency: json["currency"],
        imageLink: json["image"],
        productLink: json["product_link"],
        websiteLink: json["website_link"],
        description: json["description"],
        // rating: json["rating"] == null ? null : json["rating"].toDouble(),
        // category: json["category"] == null ? null : json["category"],
        // productType: json["product_type"],
        // tagList: List<dynamic>.from(json["tag_list"].map((x) => x)),
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // productApiUrl: json["product_api_url"],
        // apiFeaturedImage: json["api_featured_image"],
        // productColors: List<ProductColor>.from(
        //     json["product_colors"].map((x) => ProductColor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "name": name,
        "price": price,
        "price_sign": priceSign,
        "currency": currency,
        "image_link": imageLink,
        "product_link": productLink,
        "website_link": websiteLink,
        "description": description,
        "rating": rating == null ? null : rating,
        "category": category == null ? null : category,
        "product_type": productType,
        "product_api_url": productApiUrl,
        "api_featured_image": apiFeaturedImage
      };
}

class ProductColor {
  ProductColor({
    required this.hexValue,
    required this.colourName,
  });

  String hexValue;
  String colourName;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        hexValue: json["hex_value"],
        colourName: json["colour_name"] == null ? null : json["colour_name"],
      );

  Map<String, dynamic> toJson() => {
        "hex_value": hexValue,
        "colour_name": colourName == null ? null : colourName,
      };
}
