import 'package:e_commerce/core/routers/app_routers.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/Authentication/presentation/manager/cubit/cubit/auth_cubit.dart';
import 'package:e_commerce/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
         BlocProvider<AuthCubit>(
          create: (_) => getIt<AuthCubit>(),
        ),

      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouters.router,
      ),
    );
  }
}
