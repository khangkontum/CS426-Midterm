import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/user/controllers/user_controller.dart';
import 'package:e_commerce/src/shared/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/routes/router.gr.dart';
import 'package:get/instance_manager.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Theme.of(context).backgroundColor,
            child: SingleChildScrollView(
              child: FormLogin(
                  usernameController: usernameController,
                  passwordController: passwordController),
            )),
      ),
    );
  }
}

class FormLogin extends StatelessWidget {
  FormLogin({
    Key? key,
    required this.usernameController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 17.0,
            top: 51,
            right: 17,
            bottom: 51,
          ),
          child: Card(
            color: Colors.white.withOpacity(0.95),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 21, 10, 61),
              child: Column(
                children: [
                  const AppLogo(),
                  AutoSizeText("Please login!",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: const Color(0xFF2D0C57))),
                  const SizedBox(height: 33),
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      icon: Icon(Icons.person),
                      hintText: 'Your Username',
                      labelText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 43),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      icon: Icon(Icons.password),
                      hintText: 'Your Password',
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 59),
                  SizedBox(
                    height: 56,
                    width: 240,
                    child: ElevatedButton(
                      onPressed: () async {
                        await UserController.login(
                          usernameController.text,
                          passwordController.text,
                        );
                        context.router.push(RootScreen());
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(36.63, 17, 36.63, 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              "LOGIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextButton(
                    onPressed: () => context.router.push(SignupScreen()),
                    child: AutoSizeText("SIGN UP",
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: const Color(0xFF9586A8),
                              fontWeight: FontWeight.normal,
                            )),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
