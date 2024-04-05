import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/getx_controller.dart';

class DateEnterForm extends StatefulWidget {
  const DateEnterForm({
    super.key,
    required this.lableText,
    required this.controller,
    required this.mapName,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    required this.validator,
    this.value,
  });

  final bool autocorrect;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String lableText;
  final Map mapName;
  final String? Function(String?)? validator;
  final String? value;

  @override
  State<DateEnterForm> createState() => _DateEnterFormState();
}

GetController _getPassportExpiryDateController = Get.find<GetController>();

class _DateEnterFormState extends State<DateEnterForm> {
  DateTime? birthDate;
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      autocorrect: widget.autocorrect,
      onTap: () async {
        await showDatePicker(
                context: context,
                initialDate: birthDate ?? DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100))
            .then(
          (selectedDate) {
            if (selectedDate != null) {
              widget.controller.text =
                  DateFormat('dd/MM/yyyy').format(selectedDate);
              _getPassportExpiryDateController.values(
                  key: widget.value,
                  value: DateFormat('yyyy/MM/dd').format(selectedDate),
                  map: widget.mapName
                  // _getPassportExpiryDateController.personalInformation
                  );
              birthDate = selectedDate;
            }
          },
        );
      },
      decoration: InputDecoration(
          hintText: birthDate == null ? "DD/MM/YYYY" : '',
          contentPadding: const EdgeInsets.only(bottom: 7, top: 0),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(
              'assets/images/calendar.svg',
              fit: BoxFit.fill,
            ),
          ),
          suffixIconConstraints: const BoxConstraints.tightFor(width: 30, height: 20),
          labelText: widget.lableText),
    );
  }
}

class YearDateEnterForm extends StatefulWidget {
  const YearDateEnterForm({
    super.key,
    required this.lableText,
    required this.controller,
    required this.mapName,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    this.value,
    this.onChanged,
  });

  final Function(String)? onChanged;
  final bool autocorrect;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  final String lableText;
  final Map mapName;
  final String? value;
  final bool obscureText;

  @override
  State<YearDateEnterForm> createState() => _YearDateEnterFormState();
}

class _YearDateEnterFormState extends State<YearDateEnterForm> {
  DateTime? birthDate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,autovalidateMode: AutovalidateMode.onUserInteraction,

      validator: widget.validator,
      onTap: () async {
        await showDatePicker(
                context: context,
                initialDate: birthDate ?? DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100))
            .then(
          (selectedDate) {
            if (selectedDate != null) {
              widget.controller.text = DateFormat('yyyy').format(selectedDate);
              _getPassportExpiryDateController.values(
                  key: widget.value,
                  value: widget.controller.text,
                  map: widget.mapName
                  // _getPassportExpiryDateController.personalInformation
                  );
              birthDate = selectedDate;
            }
          },
        );
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: "DD/MM/YYYY",
        contentPadding: const EdgeInsets.only(bottom: 7, top: 0),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SvgPicture.asset(
            'assets/images/calendar.svg',
            fit: BoxFit.fill,
          ),
        ),
        suffixIconConstraints: const BoxConstraints.tightFor(width: 30, height: 20),
        labelText: widget.lableText,
      ),
    );
  }
}
