import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/Authentication/presentation/screen/widgets/Custom_Button.dart';
import 'package:e_commerce/features/Authentication/presentation/screen/widgets/Custom_headline_Text.dart';
import 'package:e_commerce/features/Authentication/presentation/screen/widgets/Custom_text_form_feild.dart';
import 'package:e_commerce/features/Authentication/presentation/screen/widgets/login_text.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              CustomText(text: "Full Name", size: 18),
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'Enter your full name',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 30),
              CustomText(text: "Mobile Number", size: 18),
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'Enter your mobile number',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 30),
              CustomText(text: "E-mail address", size: 18),
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'Enter your Email address',
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
              SizedBox(height: 56),
              CustomButton(text: 'Sign Up', onPressed: () {}),
              SizedBox(height: 32),
              LoginText(),
              SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
