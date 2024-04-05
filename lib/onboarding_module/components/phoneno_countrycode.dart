import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../constants/app_colors.dart';
import '../controller/getx_controller.dart';

class PhoneNoEnterForm extends StatefulWidget {
  final String lableText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool autocorrect;
  final Function(String)? onChanged;

  const PhoneNoEnterForm({
    super.key,
    required this.lableText,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<PhoneNoEnterForm> createState() => _PhoneNoEnterFormState();
}

String? phoneNumber = "";
GetController _getAlternatePhoneNoController = Get.find<GetController>();

class _PhoneNoEnterFormState extends State<PhoneNoEnterForm> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      validator: (value) {
        if (value?.number.isEmpty ?? true) {
          return "Enter Phone Number";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      dropdownIconPosition: IconPosition.trailing,
      showDropdownIcon: true,
      dropdownIcon: const Icon(
        CupertinoIcons.chevron_down,
        color: AppColors.subtitle,
      ),
      controller: widget.controller,
      obscureText: false,
      initialCountryCode: 'IN',
      enabled: true,
      decoration: InputDecoration(
        alignLabelWithHint: false,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelText: widget.lableText,
      ),
      dropdownTextStyle: const TextStyle(
        color: AppColors.title,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      style: const TextStyle(
        color: AppColors.title,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      flagsButtonPadding: const EdgeInsets.only(top: 15),
      keyboardType: TextInputType.phone,
      textAlignVertical: TextAlignVertical.bottom,
      onChanged: (phone) {
        debugPrint(phone.countryISOCode);
        //! removing the + of country code
        phoneNumber =
            phone.completeNumber.substring(1, phone.completeNumber.length);
        _getAlternatePhoneNoController.values(
            key: 'alternatePhoneNumber',
            value: phoneNumber,
            map: _getAlternatePhoneNoController.personalInformation);
        //! For country code (Future)
        // _getAlternatePhoneNoController.values(
        //     key: 'countryCode',
        //     value: phone.countryCode,
        //     map: _getAlternatePhoneNoController.personalInformation);
      },
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
    );
  }
}
