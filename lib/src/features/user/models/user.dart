import 'package:get/get_state_manager/get_state_manager.dart';

class User extends GetxController {
  User(
      {required this.username,
      required this.fullname,
      required this.address,
      required this.email,
      this.password});

  String username;
  String fullname;
  String address;
  String email;
  String? password;

  static User fromJson(jsonData) {
    return User(
        email: jsonData['email'],
        fullname: jsonData['name'],
        username: jsonData['username'],
        address: jsonData['address']);
  }
}


//  "username": "aaaaaaaaaaa",
//   "password": "bbbbbbbbbbb",
//   "name": "afsdfasf",
//   "address": "asdfasfsafas",
//   "email": "aaaa@aaa.com"