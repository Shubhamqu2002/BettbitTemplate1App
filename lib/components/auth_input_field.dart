import 'package:flutter/material.dart';
import '../config/colors/app_colors.dart';

class AuthInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? suffixIconConstraints;

  const AuthInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.contentPadding,
    this.suffixIconConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.inputFill,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.inputBorder,
              width: 1.1,
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            readOnly: readOnly,
            onTap: onTap,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.textHint,
                fontSize: 14,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              suffixIconConstraints: suffixIconConstraints,
              border: InputBorder.none,
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}