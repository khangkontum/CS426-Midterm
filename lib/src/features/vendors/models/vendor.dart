import 'dart:convert';

List<Vendor> vendorFromJson(String str) => List<Vendor>.from(
    json.decode(str)["stores"].map((x) => Vendor.fromJson(x)));

class Vendor {
  Vendor({
    required this.id,
    required this.name,
    required this.imageLink,
    required this.description,
    required this.long,
    required this.lat,
  });

  String name;
  String imageLink;
  String description;
  double long;
  double lat;
  int id;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
      id: json['id'],
      name: json['brand'],
      imageLink: json['image'],
      lat: json['lat'],
      long: json['long'],
      description: json['description']);
}
