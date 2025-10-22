import 'package:e_commerce/features/Authentication/widgets/Custom_headline_Text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: "Don't have an account? ",
          size: 18,
          fontWeight: FontWeight.w500,
        ),
        GestureDetector(
          onTap: () {
            context.pushReplacement('/register');
          },
          child: CustomText(
            text: "Create Account",
            size: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
