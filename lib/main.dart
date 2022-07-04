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
  final FlutterSecureStorage storage = Get.put(FlutterSecureStorage());

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
