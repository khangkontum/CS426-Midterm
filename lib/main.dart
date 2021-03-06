import 'package:e_commerce/src/features/product_listing/controllers/product_controller.dart';
import 'package:e_commerce/src/features/user/controllers/user_controller.dart';
import 'package:e_commerce/src/style/style.dart';
import 'package:flutter/material.dart';
// import 'package:e_commerce/routes/'
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:e_commerce/routes/router.gr.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Get.put(const FlutterSecureStorage());
  Get.put(ProductController());

  Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = myAppRouter();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      title: 'KHH',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
