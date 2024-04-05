// ignore_for_file: must_be_immutable, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:testinggetx/Components/Explore/search_container.dart';

import '../../Controller/getx_main_controller.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';

class MultiSelectList extends StatefulWidget {
  MultiSelectList({
    super.key,
    required this.list,
    required this.list2,
    required this.temp,
    required this.title,
    this.validator
  });
  final List? list;
  late List? list2;
  late List? temp;
  final String? title;
  final String? Function(List<dynamic>?)? validator;

  @override
  State<MultiSelectList> createState() => _MultiSelectListState();
}

class _MultiSelectListState extends State<MultiSelectList> {
  @override
  Widget build(BuildContext context) {
  return MultiSelectBottomSheetField(
    initialChildSize: 0.4,
    listType: MultiSelectListType.LIST,
    decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(
                color: AppColors.shadow
            )
        )
    ),
    searchable: true,
    initialValue: widget.temp!,
    // initialValue: widget.temp!.isEmpty?widget.list2!:widget.temp!,
    buttonIcon: const Icon(Icons.add, color: Colors.transparent,),
    buttonText: Text(widget.title.toString(), style: subtitle,),
    itemsTextStyle: subtitle,
    title: const Text("Animals"),
    items: widget.list!.map((name) => MultiSelectItem<String>(name, name)).toList(),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onConfirm: (values) {
      widget.temp!.clear();
      setState(() {
        widget.temp!.clear();
        widget.temp!.insertAll(0,values);
      });

    },
    validator: widget.validator,
    chipDisplay: MultiSelectChipDisplay(
      chipColor: AppColors.appBar,
      textStyle: subtitle,
      icon: Icon(CupertinoIcons.xmark, color: AppColors.subtitle.withOpacity(0.5),),
      // chipWidth: double.maxFinite,
      onTap: (item) {
        setState(() {
          widget.temp!.remove(item);
        });
      },
    ),
  );

  }
}
