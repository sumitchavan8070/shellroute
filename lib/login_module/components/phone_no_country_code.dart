
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';

class PhoneNoEnterForm extends StatefulWidget {
  final String lableText;
  final String hintText;
  final String? errorText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool autocorrect;
  final bool autofocus;
  final Function(String)? onChanged;
  final String? Function(PhoneNumber?)? validator;
  final FocusNode? focusNode;

  const PhoneNoEnterForm({
    super.key,
    required this.lableText,
    this.errorText,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
    this.autofocus = false,
    this.focusNode,
    required this.validator,
  });

  @override
  State<PhoneNoEnterForm> createState() => _PhoneNoEnterFormState();
}

String? number = "";

class _PhoneNoEnterFormState extends State<PhoneNoEnterForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: IntlPhoneField(
        focusNode: widget.focusNode,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: TextInputAction.next,
        cursorColor: AppColors.subtitle,
        dropdownIconPosition: IconPosition.trailing,
        showDropdownIcon: true,
        dropdownIcon: const Icon(
          CupertinoIcons.chevron_down,
          color: AppColors.subtitle,
          size: 18,
        ),
        controller: widget.controller,
        obscureText: false,
        autofocus: widget.autofocus,
        initialCountryCode: 'IN',
        enabled: true,
        decoration: InputDecoration(
          // counterText: "",
          errorText: widget.errorText,
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          labelText: widget.lableText,
          labelStyle: TextStyle(
                color: AppColors.subtitle.withOpacity(0.7)
            ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.subtitle.withOpacity(0.5)
            )
          ),
          floatingLabelStyle: const TextStyle(
            color: AppColors.subtitle
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.subtitle.withOpacity(0.5)
              )
          ),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.subtitle.withOpacity(0.5)
              )
          ),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.subtitle.withOpacity(0.5)
              )
          )
        ),
        dropdownTextStyle: subtitle,
        style: blackText,
        flagsButtonPadding: const EdgeInsets.only(top: 16, right: 20),
        keyboardType: TextInputType.phone,
        textAlignVertical: TextAlignVertical.bottom,
        onChanged: (phone) {
          debugPrint(phone.countryISOCode);
          number = phone.completeNumber.substring(1, phone.completeNumber.length);
        },
        inputFormatters: [LengthLimitingTextInputFormatter(10)],
      ),
    );
  }
}
