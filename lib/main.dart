import 'package:e_commerce/core/routers/app_routers.dart';
import 'package:e_commerce/core/utils/app_routers_strings.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  // ✅ تأكد إن Flutter جاهز لتحميل أي async dependencies
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.router,
    );
  }
}
