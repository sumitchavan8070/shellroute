import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../controller/getx_controller.dart';

GetController _getXController = Get.find<GetController>();

class MultipleDropDownSelection extends StatefulWidget {
  const MultipleDropDownSelection({
    super.key,
    required this.lableText,
    required this.filtertext,
    this.controller,
    this.lists,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
    this.mapKey,
    this.mapName,
    this.selectedPass,
  });

  final Function(String)? onChanged;
  final bool autocorrect;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String lableText;
  final String filtertext;
  final String? mapKey;
  final String? selectedPass;
  final Map? mapName;
  final bool obscureText;
  final List? lists;

  @override
  State<MultipleDropDownSelection> createState() =>
      _MultipleDropDownSelectionState();
}

List<dynamic> user = [];
String test ='test';

class _MultipleDropDownSelectionState extends State<MultipleDropDownSelection> {
  @override
  Widget build(BuildContext context) {
    List<S2Choice> list1 = List.filled(
      widget.lists?.length ?? 0,
      S2Choice<String>(
        title: '',
        value: '',
      ),
      growable: true,
    );

    if (widget.lists?[0].runtimeType == String) {
      for (int i = 0; i < (widget.lists?.length ?? 0); i++) {
        if (list1[i].value == '') {
          list1[i] = S2Choice<String>(
              title: '${widget.lists?[i]}', value: '${widget.lists?[i]}');
        }
      }
    } else {
      List<dynamic>? names = widget.lists?.map((e) {
        return e.name;
      }).toList();
      List<dynamic>? ids = widget.lists?.map((e) {
        return e.id;
      }).toList();
      for (int i = 0; i < (widget.lists?.length ?? 0); i++) {
        if (list1[i].value == '') {
          list1[i] =
              S2Choice<String>(title: '${names?[i]}', value: '${ids?[i]}');
        }
      }
    }
    return
      Column(
      children: [
        SmartSelect.multiple(
          title: widget.lableText,
          modalFilter: list1.length >= 6 ? true : false,
          modalHeader: list1.length >= 8 ? true : false,
          onChange: (selectedPass) {
            // setState(() {
            //   user = selectedPass.value;
            //   test = 'test-test';
            // });

            _getXController.values(
              key: widget.mapKey,
              value: selectedPass.value,
              map: widget.mapName,
            );
            // user = widget.mapName?[widget.mapKey];
            // setState(() {
            //  widget.mapName?[widget.mapKey] = user;
            // });
          },
          choiceItems: list1,
          tileBuilder: (context, value) {
            return S2Tile.fromState(
              value,
              padding: const EdgeInsets.all(0),
              // textStyle: const TextStyle(
              //     color: AppColors.title,
              //     fontSize: 16,
              //     fontWeight: FontWeight.w400),
              //? Under line
              hideValue: true,
              body: S2TileChips(
                chipLength: value.selected.length,
                chipDeleteIcon: const Icon(
                  Icons.cut,
                  color: Colors.red,
                ),
                chipLabelBuilder: (context, i) {
                  return Text(
                    widget.mapName?[widget.mapKey][i] ?? 'sdsfd',
                    style: const TextStyle(
                      color: AppColors.title,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.fade,
                  );
                },
                chipOnDelete: (i) {
                  // user = widget.mapName?[widget.mapKey];
                  // user.remove(value.selected?.choice?.removeAt(i - 1));
                  // widget.mapName?[widget.mapKey] = user;
                  debugPrint('this is i ${value.selected.choice?[i].value}');
                  widget.mapName?[widget.mapKey] = widget.mapName?[widget.mapKey].remove(value.selected.choice?[i].value);
                  // setState(() {
                  //   user.remove(value.selected.choice?[i].value);
                  // });
                },
                chipColor: Colors.white,
                chipOutlined: true,
                chipElevation: 9,
                // chipShape: OutlinedBorder(side: BorderSide(color: Colors.red)), b, t),
                // chipBrightness: Brightness.dark,
              ),
              isTwoLine: widget.mapName?[widget.mapKey] == '' ? false : true,
              dense: true,
              // paddingValueText: const EdgeInsets.only(top: 5),
              title:
              widget.mapName?[widget.mapKey] == ''
                  ? Text(
                      widget.lableText,
                      style: const TextStyle(
                          fontSize: 16, color: AppColors.palceholder),
                    )
                  : Text(
                      widget.lableText,
                      style: const TextStyle(
                          fontSize: 10, color: AppColors.subtitle),
                    ),
            );
          },
          // ? Design for the popup model and search text
          // modalConfig: S2ModalConfig(
          //   title: widget.filtertext,
          //   type: S2ModalType.popupDialog,
          //   filterHint: widget.filtertext,
          //   // //? design for the popmenu
          //   style: S2ModalStyle(
          //     elevation: 3,
          //     backgroundColor: AppColors.bg,
          //     shape: BeveledRectangleBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       side: const BorderSide(
          //         color: AppColors.border,
          //         width: 1,
          //       ),
          //     ),
          //   ),
          //   filterAuto: true,
          // ),
          // //? Design for radio on item selected
          // choiceConfig: const S2ChoiceConfig(
          //   layout: S2ChoiceLayout.list,
          //   style: S2ChoiceStyle(
          //     color: AppColors.primary,
          //     titleStyle: TextStyle(
          //         fontSize: 16,
          //         color: AppColors.palceholder,
          //         fontWeight: FontWeight.w400),
          //   ),
          //   type: S2ChoiceType.checkboxes,
          //   activeStyle: S2ChoiceStyle(
          //     accentColor: AppColors.primary,
          //     color: AppColors.primary,
          //   ),
          // ),
          // // //? Design for the header on popup
          // modalHeaderStyle: const S2ModalHeaderStyle(
          //   // centerTitle: true,
          //   textStyle: TextStyle(fontSize: 24, color: AppColors.title),
          // ),
        )
      ],
    );
  }
}
