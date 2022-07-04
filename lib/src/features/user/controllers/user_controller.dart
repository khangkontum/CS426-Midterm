import 'package:e_commerce/src/features/user/models/user.dart';
import 'package:e_commerce/src/services/remote_services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class UserController extends GetxController {
  var isSignedIn = false.obs;
  final user = User().obs;

  @override
  void onInit() async {
    super.onInit();

    // Check if log in yet
    var response = await RemoteService.authUser();
    if (response != null) {
      var userData = json.decode(response)['user'];
      user.value = User.fromJson(userData);
      isSignedIn.value = true;
    }
  }

  static login(username, password) async {
    var jsonData = await RemoteService.requestLogIn(username, password);
    if (jsonData == null) {
      return;
    }
    var data = json.decode(jsonData);
    var token = data['token'];

    final UserController userController = Get.find();
    FlutterSecureStorage storage = Get.find();
    await storage.write(key: 'jwt', value: token);
    userController.user.value = User.fromJson(data['user']);
    userController.isSignedIn.value = true;
  }

  static logOut() {
    FlutterSecureStorage storage = Get.find();
    final UserController userController = Get.find();
    storage.delete(key: 'jwt');
    userController.isSignedIn.value = false;
  }

  static signUp(User user) async {
    var token = await RemoteService.requestSignUp(user);
    if (token != null) {
      FlutterSecureStorage storage = Get.find();
      storage.write(key: 'jwt', value: token);

      final UserController userController = Get.find();
      userController.user.value = user;
      userController.isSignedIn.value = true;
    }
  }
}
