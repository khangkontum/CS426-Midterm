import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class User extends GetxController {
  User({
    this.username,
    this.fullname,
    this.phone,
    this.email,
    this.password,
  });

  String? username;
  String? fullname;
  String? phone;
  String? email;
  String? password;

  static User fromJson(jsonData) {
    return User(
      email: jsonData['email'],
      fullname: jsonData['name'],
      username: jsonData['username'],
      phone: jsonData['phone'],
    );
  }
}


//  "username": "aaaaaaaaaaa",
//   "password": "bbbbbbbbbbb",
//   "name": "afsdfasf",
//   "address": "asdfasfsafas",
//   "email": "aaaa@aaa.com"