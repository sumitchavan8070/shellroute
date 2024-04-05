import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../controller/getx_controller.dart';

GetController _getXController = Get.find<GetController>();

class DropDownSelection extends StatefulWidget {
  const DropDownSelection({
    super.key,
    required this.lableText,
    required this.filtertext,
    this.mapKeyName = '',
    this.onModalClose,
    this.validation,
    this.lists,
    this.mapKey,
    this.mapName,
    this.selectedPass,
  });

  final String lableText;
  final String Function(S2SingleChosen<dynamic>)? validation;
  final String filtertext;
  final String? mapKey;
  final String? mapKeyName;
  final Function(S2SingleState<dynamic>, bool)? onModalClose;
  final String? selectedPass;
  final Map? mapName;
  final List? lists;

  @override
  State<DropDownSelection> createState() => _DropDownSelectionState();
}

class _DropDownSelectionState extends State<DropDownSelection> {

  @override
  Widget build(BuildContext context) {
    List<dynamic>? names;
    List<dynamic>? ids;
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
      names = widget.lists?.map((e) {
        return e.name;
      }).toList();
      ids = widget.lists?.map((e) {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SmartSelect.single(
          title: widget.lableText,
          selectedValue: // list1[0],
              widget.mapName?[widget.mapKey] == ''
                  ? S2Choice(value: '', title: "")
                  : S2Choice(
                      value: widget.mapName?[widget.mapKey],
                      title: widget.mapName?[widget.mapKey],
                    ),
          selectedChoice: S2Choice(
            value: widget.mapName?[widget.mapKey],
            title: widget.mapName?[widget.mapKey],
          ),
          onModalClose: widget.onModalClose,

          //     (state, confirmed) {
          //   if (_getXController.isEmpty.value == true) {
          //     if (widget.mapName![widget.mapKey] == '') {
          //       _getXController.showAlert.value = false;
          //       _getXController.isEmpty.value == false;
          //     }
          //     // _getXController.showAlert.value = true;
          //   }
          // },
          modalFilter: list1.length >= 8 ? true : false,
          modalHeader: list1.length >= 8 ? true : false,
          onChange: (selectedPass) {
            _getXController.values(
              key: widget.mapKey,
              value: selectedPass.title,
              map: widget.mapName,
            );
            _getXController.values(
              key: widget.mapKeyName,
              value: selectedPass.value,
              map: widget.mapName,
            );
          },
          choiceItems: list1,
          tileBuilder: (context, value) {
            return S2Tile.fromState(
              padding: const EdgeInsets.all(0),
              // textStyle: const TextStyle(
              //     color: AppColors.title,
              //     fontSize: 16,
              //     fontWeight: FontWeight.w400),
              //? Under line
              body: Container(
                height: 1.156,
                width: double.infinity,
                color: const Color.fromRGBO(116, 117, 121, 0.25),
              ),
              isTwoLine: widget.mapName?[widget.mapKey] == '' ? false : true,
              dense: true,
              value,
              // paddingValueText: const EdgeInsets.only(top: 5),
              title: widget.mapName?[widget.mapKey] == ''
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
          modalConfig: S2ModalConfig(
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
            style: S2ChoiceStyle(
              color: AppColors.primary,
              titleStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.palceholder,
                  fontWeight: FontWeight.w400),
            ),
            type: S2ChoiceType.radios,
            activeStyle: S2ChoiceStyle(
              accentColor: AppColors.primary,
              color: AppColors.primary,
            ),
          ),
          // //? Design for the header on popup
          modalHeaderStyle: const S2ModalHeaderStyle(
            // centerTitle: true,
            textStyle: TextStyle(fontSize: 24, color: AppColors.title),
          ),
        ),

        Obx(
          () {
            return Column(
              children: [
                if(_getXController.showAlert.value)...[
                    Text('Select any value',
                        style: Theme.of(context).textTheme.labelSmall)]
              ],
            );
          },
        )

        // widget.mapName?[widget.mapKey] == ''
        //     ? Text('Select any value',
        //         style: Theme.of(context).textTheme.labelSmall)
        //     : Text('', style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
