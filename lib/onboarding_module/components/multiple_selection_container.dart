// ignore_for_file: deprecated_member_use, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/app_colors.dart';
import '../controller/getx_controller.dart';

class MultipleSelectionContainer extends StatefulWidget {
  final String lableText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final List? lists;
  final bool autocorrect;
  final VoidCallback? onChanged;

  const MultipleSelectionContainer({
    super.key,
    required this.lableText,
    this.lists,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<MultipleSelectionContainer> createState() =>
      _MultipleSelectionContainerState();
}

GetController _getMultiSelectionController = Get.find<GetController>();

Map<String, Widget> countryListMap = {
  'UK': Container(
    height: 21,
    width: 33,
    color: AppColors.bg,
    child: SvgPicture.asset('assets/images/england.svg', fit: BoxFit.fitHeight),
  ),
  'Canada': Container(
    height: 21,
    width: 33,
    color: AppColors.bg,
    child: SvgPicture.asset('assets/images/canada.svg', fit: BoxFit.fill),
  ),
  'USA': Container(
    height: 21,
    width: 33,
    color: AppColors.bg,
    child: SvgPicture.asset(
      'assets/images/us.svg',
      fit: BoxFit.fill,
    ),
  ),
  'Australia': Container(
    height: 21,
    width: 33,
    color: AppColors.bg,
    child: SvgPicture.asset('assets/images/australia.svg', fit: BoxFit.fill),
  ),
};

List<bool> selectedCountry = List.filled(countryFlag.length, false);
List<Widget> countryFlag = countryListMap.values.toList();
List<String> countryName = countryListMap.keys.toList();

class _MultipleSelectionContainerState
    extends State<MultipleSelectionContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      alignment: Alignment.topLeft,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.lableText,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Heebo',
              color: AppColors.title,
              fontWeight: FontWeight.w400,
            ),
          ).pOnly(bottom: 10),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: (76 / 65),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0),
            itemBuilder: (context, index) {
              return Container(
                height: 65,
                width: 50,
                decoration: selectedCountry[index]
                    ? BoxDecoration(
                        color: AppColors.bg,
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(5),
                      )
                    : BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: AppColors.bg,
                      ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    countryFlag[index],
                    Text(
                      countryName[index],
                      style: selectedCountry[index]
                          ? const TextStyle(
                              color: AppColors.primary,
                              overflow: TextOverflow.ellipsis,
                              fontFamily: 'Heebo',
                              fontSize: 14,
                              fontWeight: FontWeight.w400)
                          : const TextStyle(
                              color: AppColors.subtitle,
                              fontFamily: 'Heebo',
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400),
                    ).pOnly(bottom: 7),
                  ],
                ),
              ).onTap(
                () {
                  setState(() {
                    selectedCountry[index] = !selectedCountry[index];
                  });
                  _getMultiSelectionController.refresh();
                  selectedCountry[index]
                      ? _getMultiSelectionController
                          .studyAbroadPref['preferred_country']
                          .add(countryName[index])
                      : _getMultiSelectionController
                              .studyAbroadPref['preferred_country']
                              .contains(countryName[index])
                          ? _getMultiSelectionController
                              .studyAbroadPref['preferred_country']
                              .remove(countryName[index])
                          : _getMultiSelectionController
                              .studyAbroadPref['preferred_country']
                              .add(countryName[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

//! for selecting multiple year
class YearSelectMultiple extends StatefulWidget {
  final String lableText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final List? listsYear;
  final bool autocorrect;
  final Function(String)? onChanged;

  const YearSelectMultiple({
    super.key,
    required this.lableText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.listsYear,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<YearSelectMultiple> createState() => _YearSelectMultipleState();
}

List<bool> yearSelect = List.filled(3, false);
List<bool> recommended = [false, true, false];

class _YearSelectMultipleState extends State<YearSelectMultiple> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.lableText,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Heebo',
              color: AppColors.title,
              fontWeight: FontWeight.w400,
            ),
          ).pOnly(bottom: 10),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (102.5 / 44),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0),
            itemBuilder: (context, index) {
              return Container(
                height: 44,
                decoration: yearSelect[index]
                    ? BoxDecoration(
                        color: AppColors.bg,
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(5),
                      )
                    : BoxDecoration(
                        color: AppColors.bg,
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(5),
                      ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    recommended[index]
                        ?
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        // matchTextDirection: true,
                        'assets/images/recommended.svg',
                        alignment: Alignment.topLeft,
                        width: 13.08,
                        height: 15,
                      ),
                    )
                      : SvgPicture.asset(
                    matchTextDirection: true,
                    'assets/images/recommended.svg',
                          color: AppColors.bg,
                          alignment: Alignment.topLeft,
                          width: 13.08,
                          height: 15,
                        ),
                    // .pOnly(
                    //     left: MediaQuery.of(context).size.width * 0.227),
                    Text(
                      "${widget.listsYear?[index]}",
                      style: yearSelect[index]
                          ? const TextStyle(
                              color: AppColors.primary,
                              overflow: TextOverflow.ellipsis,
                              fontFamily: 'Heebo',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )
                          : const TextStyle(
                              color: AppColors.subtitle,
                              fontFamily: 'Heebo',
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400,
                            ),
                    ),
                    // .pOnly( top:MediaQuery.of(context).size.width*.04,left:MediaQuery.of(context).size.width*.09 ),
                  ],
                ),
              ).onTap(
                () {
                  setState(() {
                    yearSelect[index] = !yearSelect[index];
                  });
                  _getMultiSelectionController.refresh();

                  yearSelect[index]
                      ? _getMultiSelectionController
                          .studyAbroadPref['intake_years']
                          .add(widget.listsYear?[index])
                      : _getMultiSelectionController
                              .studyAbroadPref['intake_years']
                              .contains(widget.listsYear?[index])
                          ? _getMultiSelectionController
                              .studyAbroadPref['intake_years']
                              .remove(widget.listsYear?[index])
                          : debugPrint("not removed ");

                  debugPrint(
                      '${_getMultiSelectionController.studyAbroadPref['intake_years']}');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class IntakeSelectMultiple extends StatefulWidget {
  final String lableText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final List? listsIntake;
  final bool autocorrect;
  final Function(String)? onChanged;

  const IntakeSelectMultiple({
    super.key,
    required this.lableText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.listsIntake,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<IntakeSelectMultiple> createState() => _IntakeSelectMultipleState();
}

List<bool> selectedIntake = List.filled(intakeMonths.length, false);
List<String> intakeMonths = [
  'Sep - Nov',
  'Mar - May',
  'Jun - Aug',
  'Dec - Feb',
  'Not Sure'
];

class _IntakeSelectMultipleState extends State<IntakeSelectMultiple> {
  @override
  Widget build(BuildContext context) {
    List<String> intakeSeason = ['fall', 'Spring', 'Summer', 'Winter'];
    List<Widget> intakeIcons = [
      SizedBox(
        height: 20,
        width: 20,
        child: SvgPicture.asset('assets/images/fall.svg',
            color: selectedIntake[0] ? AppColors.primary : AppColors.title),
      ),
      SizedBox(
        height: 20,
        width: 20,
        child: SvgPicture.asset('assets/images/spring.svg',
            color: selectedIntake[1] ? AppColors.primary : AppColors.title),
      ),
      SizedBox(
        height: 20,
        width: 20,
        child: SvgPicture.asset('assets/images/summer.svg',
            color: selectedIntake[2] ? AppColors.primary : AppColors.title),
      ),
      SizedBox(
        height: 20,
        width: 20,
        child: SvgPicture.asset('assets/images/winter.svg',
            color: selectedIntake[3] ? AppColors.primary : AppColors.title),
      ),
      SizedBox(
        height: 20,
        width: 20,
        child: SvgPicture.asset('assets/images/not_sure.svg',
            color: selectedIntake[4] ? AppColors.primary : AppColors.title),
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      // height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryBg,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Which intake session are you planning to go in?',
            style: TextStyle(
                color: AppColors.title,
                fontFamily: 'Heebo',
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w400),
          ).pOnly(bottom: 10),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (145 / 45),
                mainAxisSpacing: 17.0,
                crossAxisSpacing: 15.0),
            itemBuilder: (context, index) {
              return Container(
                // width: 158,
                // height: 44,
                alignment: Alignment.center,
                decoration: selectedIntake[index]
                    ? BoxDecoration(
                        color: AppColors.bg,
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(5),
                      )
                    : BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: AppColors.bg,
                      ),
                child: Row(
                  children: [
                    intakeIcons[index].pSymmetric(h: 13, v: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: intakeMonths[index] == 'Not Sure'
                              ? const EdgeInsets.only(top: 0.0)
                              : const EdgeInsets.all(0.0),
                          child: Text(
                            intakeMonths[index],
                            style: selectedIntake[index]
                                ? const TextStyle(
                                    color: AppColors.primary,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Heebo',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)
                                : const TextStyle(
                                    color: AppColors.title,
                                    fontFamily: 'Heebo',
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                        if (intakeMonths[index] != 'Not Sure') ...[
                          Text(
                            intakeSeason[index],
                            style: selectedIntake[index]
                                ? const TextStyle(
                                    color: AppColors.primary,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Heebo',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400)
                                : const TextStyle(
                                    color: AppColors.subtitle,
                                    fontFamily: 'Heebo',
                                    fontSize: 13,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400),
                          ),
                        ]
                      ],
                    ).pSymmetric(v: 5),
                  ],
                ),
              ).onTap(
                () {
                  setState(
                    () {
                      selectedIntake[index] = !selectedIntake[index];
                    },
                  );
                  _getMultiSelectionController.refresh();
                  // if (widget.onChanged != null) {
                  //   widget.onChanged;
                  // }
                  selectedIntake[index]
                      ? _getMultiSelectionController
                          .studyAbroadPref['intake_sessions']
                          .add(intakeMonths[index])
                      : _getMultiSelectionController
                              .studyAbroadPref['intake_sessions']
                              .contains(intakeMonths[index])
                          ? _getMultiSelectionController
                              .studyAbroadPref['intake_sessions']
                              .remove(intakeMonths[index])
                          : debugPrint("not removed ");

                  debugPrint(
                      'inte alfdksd ${_getMultiSelectionController.studyAbroadPref}');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
