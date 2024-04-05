// ignore_for_file: invalid_use_of_protected_member

import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../controller/getx_controller.dart';

class MultipleDropDown extends StatefulWidget {
  const MultipleDropDown({
    super.key,
    required this.lableText,
    required this.filtertext,
    this.lists,
    this.onChanged,
    this.mapKey,
    this.mapName,
  });

  final Function(String)? onChanged;
  final String lableText;
  final String filtertext;
  final String? mapKey;
  final RxMap? mapName;
  final List? lists;

  @override
  State<MultipleDropDown> createState() => _MultipleDropDownState();
}

GetController _getXController = Get.find<GetController>();

class _MultipleDropDownState extends State<MultipleDropDown> {
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

    return Column(
      children: [
        SmartSelect.multiple(
          title: widget.lableText,
          selectedValue: _getXController.user?.value ?? [],
          onChange: (selected) {
            _getXController.user?.value = selected.value;
            _getXController.userTitle?.value = selected.title!;
            widget.mapName?[widget.mapKey] = _getXController.userTitle?.value;
          },
          choiceItems: list1,
          validation: (chosen) {
            return chosen.length >= 4 ? 'Choose up to 3' : '';
          },
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              padding: const EdgeInsets.all(0),
              // textStyle: const TextStyle(
              //     color: AppColors.title,
              //     fontSize: 16,
              //     fontWeight: FontWeight.w400),
              state,
              isTwoLine: false,
              dense: true,
              hideValue: true,
              selected: true,
              title: Text(
                widget.lableText,
                style: const TextStyle(fontSize: 16, color: AppColors.subtitle),
              ),
              body: Obx(() {
                return S2TileChips(
                  chipShape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: AppColors.border,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  chipDeleteIcon: const Icon(
                    CupertinoIcons.clear_thick,
                    size: 20,
                    color: AppColors.title,
                  ),
                  chipOnDelete: (index) {
                    _getXController.user?.removeAt(index);
                    state.selected.choice?.removeAt(index);
                    _getXController.userTitle?.removeAt(index);
                    widget.mapName?[widget.mapKey] = _getXController.userTitle;
                    setState(() {});
                  },
                  chipLength: widget.mapName?[widget.mapKey].length,
                  chipOutlined: true,
                  chipOpacity: .01,
                  chipColor: AppColors.bg,
                  chipLabelBuilder: (context, index) {
                    return Text(
                      '${widget.mapName?[widget.mapKey][index]}',
                      style: const TextStyle(
                        color: Color(0xFF24292D),
                        fontSize: 16,
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                      ),
                    );
                  },
                );
              }),
            );
          },
          modalConfig: S2ModalConfig(
            headerStyle: const S2ModalHeaderStyle(
              backgroundColor: AppColors.primary,
            ),
            confirmColor: Colors.red,
            title: widget.filtertext,
            type: S2ModalType.popupDialog,
            filterHint: widget.filtertext,
            // //? design for the popmenu
            style: S2ModalStyle(
              elevation: 3,
              backgroundColor: AppColors.bg,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(
                  color: AppColors.border,
                  width: 1,
                ),
              ),
            ),
            filterAuto: true,
          ),
          //? Design for radio on item selected
          choiceConfig: const S2ChoiceConfig(
            layout: S2ChoiceLayout.list,
            style: S2ChoiceStyle(
              color: AppColors.primary,
              titleStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.palceholder,
                  fontWeight: FontWeight.w400),
            ),
            type: S2ChoiceType.checkboxes,
            activeStyle: S2ChoiceStyle(
              accentColor: AppColors.primary,
              color: AppColors.primary,
            ),
          ),
          // //? Design for the header on popup
          modalHeaderStyle: const S2ModalHeaderStyle(
            // centerTitle: true,
            textStyle: TextStyle(fontSize: 24, color: AppColors.bg),
          ),
        ),
        Container(
          color: AppColors.border,
          height: 1,
          width: double.infinity,
        )
      ],
    );
  }
}
