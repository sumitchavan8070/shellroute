import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../controller/getx_controller.dart';

class NormalDropDown extends StatefulWidget {
  const NormalDropDown({
    super.key,
    required this.lableText,
    required this.filtertext,
    this.lists,
    this.mapKey,
    this.mapName,
    this.selectedPass,
  });

  final String lableText;
  final String filtertext;
  final String? mapKey;
  final String? selectedPass;
  final Map? mapName;
  final List<String>? lists;
  @override
  State<NormalDropDown> createState() => _NormalDropDownState();
}

GetController _getXController = Get.find<GetController>();

class _NormalDropDownState extends State<NormalDropDown> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropDownList = List.filled(
      widget.lists?.length ?? 0,
      const DropdownMenuItem(
        value: '',
        child: Text(''),
      ),
    );
    for (int i = 0; i < (widget.lists?.length ?? 0); i++) {
      dropDownList[i] = DropdownMenuItem(
        value: '${widget.lists?[i]}',
        enabled: widget.lists?[0] != widget.lists?[i],
        child: Obx( () => Text(
          '${widget.lists?[i]}',
          style: widget.mapName?[widget.mapKey] == widget.lists?[i]
              ? const TextStyle(color: AppColors.title)
              : const TextStyle(color: AppColors.palceholder),
        ),
        ),
      );
    }
    // widget.selectedPass = widget.mapName?[widget.mapKey];/
    // TODO: Handle the preferred course select choice
    // TODO: Create the validation for the dropdown
    return DropdownButtonFormField(
      value: widget.mapName?[widget.mapKey] == ''
          ? null
          : _getXController.educationDetails.isEmpty ? '${widget.mapName?[widget.mapKey]}' : widget.mapName?[widget.mapKey],
      validator: (value) => value == null ? 'Select any value' : null,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.palceholder,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 0.0, bottom: 4),
        labelText: widget.lableText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.palceholder,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.subtitle,
          ),
        ),
      ),
      // style: widget.mapName?[widget.mapKey]  ==  widget.mapName?[widget.mapKey]?
      //     TextStyle(color: AppColors.palceholder)
      // : TextStyle(color: AppColors.primary),

      items: dropDownList,
      onChanged: (value) {
        _getXController.values(
          key: widget.mapKey,
          value: value,
          map: widget.mapName,
        );
      },
    );
  }
}
