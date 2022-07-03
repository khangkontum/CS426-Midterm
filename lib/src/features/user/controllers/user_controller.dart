import 'package:e_commerce/src/features/user/models/user.dart';
import 'package:e_commerce/src/services/remote_services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserController extends GetxController {
  var isSignedIn = false.obs;

  @override
  void onInit() async {
    super.onInit();

    // Check if log in yet
    final FlutterSecureStorage storage = Get.put(new FlutterSecureStorage());
    var token = await storage.read(key: "jwt");
    var jsonData = RemoteService.authUser(token);
  }

  static login(username, password) async {
    var token = await RemoteService.requestLogIn(username, password);
    final UserController userController = Get.find();
    FlutterSecureStorage storage = Get.find();
    await storage.write(key: 'jwt', value: token);
    userController.isSignedIn.value = true;
  }

  static signUp(User user) async {
    var token = await RemoteService.requestSignUp(user);
    FlutterSecureStorage storage = Get.find();
    storage.write(key: 'jwt', value: token);
  }
}

User? userLogin(token) {}
