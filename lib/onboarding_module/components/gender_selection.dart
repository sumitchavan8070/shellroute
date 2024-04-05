import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/app_colors.dart';
import '../controller/getx_controller.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

GetController _getGenderSelectionController = Get.find<GetController>();

bool isMale = true;
bool isFemale = false;

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 54,
                decoration: ShapeDecoration(
                    color: isMale ? AppColors.bg : AppColors.secondaryBg,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    shadows: isMale
                        ? const [
                            BoxShadow(
                              color: Color(0x23000000),
                              blurRadius: 6,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ]
                        : const [
                            BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 0,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ]),
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset('assets/images/male.svg',
                          // ignore: deprecated_member_use
                          color:
                              isMale ? AppColors.primary : AppColors.subtitle)
                      .pOnly(top: 9, bottom: 9, right: 10),
                  const WidthBox(12),
                  Text(
                    "Male",
                    style: TextStyle(
                        fontFamily: 'Heebo',
                        color: isMale ? AppColors.primary : AppColors.subtitle,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ]),
              ).onTap(() {
                setState(() {
                  isMale = true;
                  isFemale = false;
                  if (kDebugMode) {
                    print('male$isMale');
                  }
                  if (kDebugMode) {
                    print('female$isFemale');
                  }
                });
                _getGenderSelectionController.values(
                  key: 'gender',
                  value: isMale ? 'male' : 'female',
                  map: _getGenderSelectionController.personalInformation,
                );
              }),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 54,
                decoration: ShapeDecoration(
                    color: isFemale ? AppColors.bg : AppColors.secondaryBg,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    shadows: isFemale
                        ? const [
                            BoxShadow(
                              color: Color(0x23000000),
                              blurRadius: 6,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ]
                        : const [
                            BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 0,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ]),
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset('assets/images/female.svg',
                          // ignore: deprecated_member_use
                          color:
                              isFemale ? AppColors.primary : AppColors.subtitle)
                      .pOnly(top: 9, bottom: 9, right: 10),
                  const WidthBox(12),
                  Text(
                    "Female",
                    style: TextStyle(
                        fontFamily: 'Heebo',
                        color:
                            isFemale ? AppColors.primary : AppColors.subtitle,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ]),
              ).onTap(() {
                setState(
                  () {
                    isMale = false;
                    isFemale = true;
                    if (kDebugMode) {
                      print('male$isMale');
                    }
                    if (kDebugMode) {
                      print('female$isFemale');
                    }
                  },
                );
                _getGenderSelectionController.values(
                  key: 'gender',
                  value: isFemale ? 'female' : 'male',
                  map: _getGenderSelectionController.personalInformation,
                );
              }),
            ),
          ],
        ).pOnly(top: 24, bottom: 24),
      ],
    );
  }
}
