import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routers_strings.dart';
import 'package:e_commerce/features/Authentication/presentation/manager/cubit/cubit/auth_cubit.dart';
import 'package:e_commerce/features/Authentication/presentation/screen/widgets/Custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/Authentication/presentation/screen/widgets/custom_button.dart';
import 'package:e_commerce/features/Authentication/presentation/screen/widgets/custom_headline_text.dart';
import 'package:e_commerce/features/Authentication/presentation/screen/widgets/create_account_text.dart';
import 'package:go_router/go_router.dart';

class LoginBodyView extends StatefulWidget {
  const LoginBodyView({super.key});
  @override
  State<LoginBodyView> createState() => _LoginBodyViewState();
}
class _LoginBodyViewState extends State<LoginBodyView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late bool change = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        } else if (state is AuthFailure) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context); // ⬅️ يقفل اللودر لو مفتوح
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        } else if (state is AuthSuccess) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context); // ⬅️ يقفل اللودر
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Successful!"),
              duration: Duration(seconds: 1),
            ),
          );
          context.go(AppRoutersStrings.home);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/matgar_logo.png',
                      width: 250,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(text: "Welcome To Matgar", size: 24),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Please sign in with your mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        height: 1.12,
                        letterSpacing: -0.17,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  CustomText(text: "Email", size: 18),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30),
                  CustomText(text: "Password", size: 18),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: change,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        change ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          change = !change;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: "Forget Password !",
                      size: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 56),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus(); // ⬅️ يقفل الكيبورد
                        context.read<AuthCubit>().signin(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 32),
                  const CreateAccountText(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
