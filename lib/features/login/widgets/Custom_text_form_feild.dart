import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Key? fieldKey;
  final void Function(String)? onChanged;
  final void Function(String?)? onsaved;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;

  const CustomTextFormField({
    super.key,
    this.fieldKey,
    this.onChanged,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText,
    this.onsaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      cursorColor: AppColors.darkBlue,
      cursorWidth: 2, 
      cursorHeight: 22,
      onChanged: onChanged,
      onSaved: onsaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        } else {
          return null;
        }
      },
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 17,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          height: 1,
          letterSpacing: -0.17,
        ),

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: borderDecoration(AppColors.primary),
        focusedBorder: borderDecoration(AppColors.white),
        enabledBorder: borderDecoration(AppColors.white),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
      ),
      keyboardType: keyboardType,
    );
  }

  OutlineInputBorder borderDecoration(Color color) => OutlineInputBorder(
    borderSide: BorderSide(
      width: 1,
      strokeAlign: BorderSide.strokeAlignCenter,
      color: color,
    ),
    borderRadius: BorderRadius.circular(15),
  );
}
