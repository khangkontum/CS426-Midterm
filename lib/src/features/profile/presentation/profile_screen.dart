import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/user/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/shared/app_logo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/routes/router.gr.dart';
import 'package:get/instance_manager.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          const AppLogo(),
          const SizedBox(height: 20),
          Field(
              fieldIcon: const Icon(Icons.verified_user_outlined),
              fieldTittle: userController.user.value.username.toString()),
          Field(
              fieldIcon: const Icon(Icons.person_outline_sharp),
              fieldTittle: userController.user.value.fullname.toString()),
          Field(
              fieldIcon: const Icon(Icons.phone_outlined),
              fieldTittle: userController.user.value.phone.toString()),
          Field(
              fieldIcon: const Icon(Icons.email_outlined),
              fieldTittle: userController.user.value.email.toString()),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                UserController.logOut();
                context.router.push(RootScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 100,
                ),
                child: AutoSizeText(
                  "Log Out",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}

class Field extends StatelessWidget {
  const Field({
    Key? key,
    required this.fieldTittle,
    required this.fieldIcon,
  }) : super(key: key);

  final Icon fieldIcon;
  final String fieldTittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: OutlinedButton(
          onPressed: () {},
          child: Row(
            children: [
              fieldIcon,
              const SizedBox(width: 20),
              AutoSizeText(
                fieldTittle,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Colors.black,
                    ),
              )
            ],
          )),
    );
  }
}
