import 'package:e_commerce/core/routers/app_routers.dart';
import 'package:e_commerce/core/utils/app_routers_strings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouters().onGenerateRoute,
      initialRoute: AppRoutersStrings.home,
    );
  }
}
