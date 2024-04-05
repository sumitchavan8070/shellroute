// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/app_colors.dart';


class enterFormField extends StatelessWidget {
  final String lableText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isReadOnly;

  const enterFormField({
    super.key,
    required this.lableText,
    required this.validator,
    required this.inputFormatters,
    this.controller,
    this.isReadOnly = false,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: isReadOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      autocorrect: autocorrect,
      onChanged: onChanged,
      style: const TextStyle(
          color: AppColors.title, fontSize: 16, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        labelText: lableText,
      ),
    ).pOnly(bottom: 18);
  }
}
