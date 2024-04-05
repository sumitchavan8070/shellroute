
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testinggetx/onboarding_module/components/phoneno_countrycode.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_form_validator.dart';
import '../controller/getx_controller.dart';
import 'enter_form_field.dart';

class AddAlternateMobileNoEnterForm extends StatefulWidget {
  const AddAlternateMobileNoEnterForm({
    super.key,
    required this.lableText,
    required this.controller,
    required this.controller2,
    required this.value,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
  });

  final Function(String)? onChanged;
  final bool autocorrect;
  final TextEditingController controller;
  final TextEditingController controller2;
  final TextInputType keyboardType;
  final String lableText;
  final bool obscureText;
  final String value;

  @override
  State<AddAlternateMobileNoEnterForm> createState() =>
      _AddAlternateMobileNoEnterFormState();
}

GetController _getAlternateNoController = Get.find<GetController>();

class _AddAlternateMobileNoEnterFormState
    extends State<AddAlternateMobileNoEnterForm> {
  bool isAdding = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autocorrect: widget.autocorrect,
          onChanged: widget.onChanged,
          readOnly: true,
          inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^[1-9]?[0-9]*$')),
                          CustomTextInputFormatter(),
                        ],
          style: const TextStyle(
              color: AppColors.title,
              fontSize: 16,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            labelText: widget.lableText,
          ),
        ),
        isAdding
            ? const Text("")
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "+ ADD ${widget.value}",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                        color: AppColors.primary,
                        fontSize: 16,
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w400),
                  ).onTap(
                    () {
                      setState(() {
                        isAdding = !isAdding;
                      });
                    },
                  ).pOnly(top: 5),
                ],
              ),
        isAdding
            ? PhoneNoEnterForm(
                lableText: "Alternate Mobile Number",
                controller: widget.controller2,
                hintText: "Enter Alternate Mobile Number",
                onChanged: (value) {
                  _getAlternateNoController.values(
                    key: 'alternate_phone',
                    value: value,
                    map: _getAlternateNoController.personalInformation,
                  );
                },
              )
            : const Text(
                "",
                style: TextStyle(fontSize: 0),
              ),
      ],
    );
  }
}

// ! for alternate Email ID
class AddAlternateEmailIdEnterForm extends StatefulWidget {
  const AddAlternateEmailIdEnterForm({
    super.key,
    required this.lableText,
    required this.controller,
    required this.controller2,
    required this.value,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
  });

  final Function(String)? onChanged;
  final bool autocorrect;
  final TextEditingController controller;
  final TextEditingController controller2;
  final TextInputType keyboardType;
  final String lableText;
  final bool obscureText;
  final String value;

  @override
  State<AddAlternateEmailIdEnterForm> createState() =>
      AddAlternateEmailIdEnterFormState();
}

class AddAlternateEmailIdEnterFormState
    extends State<AddAlternateEmailIdEnterForm> {
  bool isAdding = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          autocorrect: widget.autocorrect,
          onChanged: widget.onChanged,
          readOnly: true,
          inputFormatters: const [],
          style: const TextStyle(
            color: AppColors.title,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            labelText: widget.lableText,
          ),
        ),
        isAdding
            ? const Text("")
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "+ ADD ${widget.value}",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.primary,
                      fontSize: 16,
                      fontFamily: 'Heebo',
                      fontWeight: FontWeight.w400,
                    ),
                  ).onTap(
                    () {
                      setState(() {
                        isAdding = !isAdding;
                      });
                    },
                  ).pOnly(top: 5),
                ],
              ),
        isAdding
            ? enterFormField(
              inputFormatters: [EmailAndDomainFormatter()],
                lableText: "Enter ${widget.value}",
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _getAlternateNoController.values(
                    key: 'secondary_email',
                    value: value,
                    map: _getAlternateNoController.personalInformation,
                  );
                },
                validator: (string) {
                  return null;
                },
              )
            : const Text(
                '',
                style: TextStyle(
                  fontSize: 0,
                ),
              )
      ],
    );
  }
}
