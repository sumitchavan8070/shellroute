import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/app_colors.dart';


class EditableEnterForm extends StatelessWidget {
  final String lableText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const EditableEnterForm({
    super.key,
    required this.lableText,
    required this.validator,
    required this.controller,
    required this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      autocorrect: autocorrect,
      onChanged: onChanged,
      style: const TextStyle(
          color: AppColors.title, fontSize: 16, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 7, top: 0),
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(
            Icons.edit,
            // size: 24,
            color: AppColors.primary,
          ),
        ),
        suffixIconConstraints: const BoxConstraints.tightFor(width: 20, height: 20),
        labelText: lableText,
      ),
    ).pOnly(bottom: 18);
  }
}
