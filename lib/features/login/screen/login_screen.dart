import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/login/widgets/Custom_Button.dart';
import 'package:e_commerce/features/login/widgets/Custom_headline_Text.dart';
import 'package:e_commerce/features/login/widgets/Custom_text_form_feild.dart';
import 'package:e_commerce/features/login/widgets/create_account_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool change = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/matgar_logo.png', // حط مسار اللوجو بتاعك
                  width: 250,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(text: "Welcome To Matgar", size: 24),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 3),
              CustomText(text: "User Name", size: 18),
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'User Name',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              CustomText(text: "Password", size: 18),
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'Password',
                obscureText: change,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  icon: Icon(change ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      change = !change;
                    });
                  },
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: CustomText(
                  text: "Forget Password !",
                  size: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 56),
              CustomButton(text: 'Login', onPressed: () {}),
              SizedBox(height: 32),
              CreateAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
