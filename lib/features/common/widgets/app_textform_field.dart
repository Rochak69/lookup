import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/res/colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.title,
    super.key,
    this.validator,
    this.hintText,
    this.label,
    this.prefixIcon,
    this.textEditingController,
    this.decoration,
    this.textInputType = TextInputType.name,
    this.obscureText = false,
    this.suffixIcon,
    this.isReadOnly = false,
    this.textInputAction,
  });
  final String? label;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final InputDecoration? decoration;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isReadOnly;
  final String title;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12.sp, color: AppColors.white),
        ),
        TextFormField(
          style: TextStyle(fontSize: 12.sp, color: AppColors.white),
          obscureText: obscureText,
          validator: validator,
          keyboardType: textInputType,
          controller: textEditingController,
          textInputAction: textInputAction,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(0, 4.h, 10, 4.h),
            isDense: true,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.white),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
