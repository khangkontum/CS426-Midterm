import 'package:e_commerce/src/features/root/features/login/login_screen.dart';
import 'package:e_commerce/src/features/user/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/routes/router.gr.dart';
import 'package:get/instance_manager.dart';

class RootScreen extends StatelessWidget {
  RootScreen({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (userController.isSignedIn.value) context.router.push(HomeRoute());
        return LoginScreen();
      }),
    );
  }
}
