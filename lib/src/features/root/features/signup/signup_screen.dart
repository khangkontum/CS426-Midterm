import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/user/controllers/user_controller.dart';
import 'package:e_commerce/src/features/user/models/user.dart';
import 'package:e_commerce/src/shared/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/routes/router.gr.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final _inputController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 17.0,
                      right: 17,
                      top: 51,
                      bottom: 51,
                    ),
                    child: Card(
                      color: Colors.white.withOpacity(0.95),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 21, 20, 61),
                        child: FormColumn(
                          nameController: nameController,
                          emailController: emailController,
                          usernameController: usernameController,
                          passwordController: passwordController,
                          phoneController: phoneController,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class FormColumn extends StatelessWidget {
  const FormColumn(
      {Key? key,
      required this.nameController,
      required this.emailController,
      required this.usernameController,
      required this.passwordController,
      required this.phoneController})
      : super(key: key);

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppLogo(),
        AutoSizeText("Sign up",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: const Color(0xFF2D0C57))),
        const SizedBox(height: 33),
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            icon: Icon(Icons.tag_faces),
            hintText: 'Full Name',
            labelText: 'Your Name',
          ),
        ),
        const SizedBox(height: 43),
        TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            icon: Icon(Icons.email_outlined),
            hintText: 'Email',
            labelText: 'Your Email',
          ),
        ),
        const SizedBox(height: 43),
        TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            icon: Icon(Icons.phone_outlined),
            hintText: 'Your Mobile Number',
            labelText: 'Phone',
          ),
        ),
        const SizedBox(height: 43),
        TextFormField(
          controller: usernameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            icon: Icon(Icons.person_outline),
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
            icon: Icon(Icons.password_outlined),
            hintText: 'Your Password',
            labelText: 'Password',
          ),
        ),
        const SizedBox(height: 59),
        SizedBox(
          height: 56,
          width: 240,
          child: ElevatedButton(
            onPressed: () => UserController.signUp(User(
                email: emailController.text,
                password: passwordController.text,
                phone: phoneController.text,
                username: usernameController.text,
                fullname: nameController.text)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36.63, 17, 36.63, 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "SIGN UP",
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
          onPressed: () => context.router.pop(),
          child: AutoSizeText("I ALREADY HAVE AN ACCOUNT",
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: const Color(0xFF9586A8),
                    fontWeight: FontWeight.normal,
                  )),
        )
      ],
    );
  }
}
