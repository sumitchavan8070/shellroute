// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testinggetx/onboarding_module/view/DocumentUpload/first_page.dart';
import 'package:testinggetx/onboarding_module/view/budget_preference.dart';
import 'package:testinggetx/onboarding_module/view/education_details.dart';
import 'package:testinggetx/onboarding_module/view/personal_information.dart';
import 'package:testinggetx/onboarding_module/view/sudy_prefdetails.dart';
import 'package:testinggetx/onboarding_module/view/test_status.dart';
import 'package:velocity_x/velocity_x.dart';
import 'constants/app_colors.dart';
import 'onboarding_module/controller/getx_controller.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

GetController _getXController = Get.find<GetController>();

class _CustomStepperState extends State<CustomStepper> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List allPageName = [
    'Personal Information',
    'Education Details',
    'Study Abroad Preferences',
    'Budget Preferences',
    'Test Status',
    'Documents',
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> allPages = [
      const PersonalInformation(),
      const EduTest(),
      const StudyAbroadPref(),
      const BudgetPreference(),
      const TestBudget(),
      const DocumentHub(),
      // PopupMenuButtonPage(),
    ];
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondaryBg,
        elevation: 3,
        title: Row(
          children: [
            const Icon(
              CupertinoIcons.arrow_left,
              color: AppColors.primary,
              size: 20,
            ).onTap(() {
              if (_getXController.pagers.value > 0) {
                _getXController.pagers.value =
                    _getXController.pagers.value - 1;
                debugPrint(' pager value from icon ontap if ${_getXController.pagers.value}');
              } else {
                _getXController.pagers.value = 0;
                debugPrint(' pager value from icon ontap else ${_getXController.pagers.value}');
              }
            }),
            const WidthBox(8),
            Obx(
              () => Text(
                '${allPageName[_getXController.pagers.value]}' == 'null'
                    ? 'Personal Information'
                    : '${allPageName[_getXController.pagers.value]}',
                style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeightBox(10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisAlignment : MainAxisAlignment.spaceAround,
                children: [
                  StepperComponent(
                    isFirst: true,
                    currentIndex: _getXController.pagers.value,
                    index: 0,
                    title: allPageName[0],
                    onTap: () {
                      _getXController.pagers.value = 0;
                      _getXController.pagers.value == 0
                          ? _getXController.pagers.value = 0
                          : _pageController.jumpToPage(0);
                      debugPrint('value of pagerr ${_getXController.pagers.value}  ');
                    },
                  ),
                  StepperComponent(
                    currentIndex: _getXController.pagers.value,
                    index: 1,
                    title: allPageName[1],
                    onTap: () {
                      // setState(() {
                      _getXController.pagers.value = 1;
                      // });
                      _getXController.pagers.value == 1
                          ? _getXController.pagers.value = 1
                          : _pageController.jumpToPage(1);

                      debugPrint('value of pagerr ${_getXController.pagers.value}  ');

                    },
                  ),
                  StepperComponent(
                    currentIndex: _getXController.pagers.value,
                    title: allPageName[2],
                    index: 2,
                    onTap: () {
                      // setState(() {
                      _getXController.pagers.value = 2;
                      // });
                      _getXController.pagers.value == 2
                          ? _getXController.pagers.value = 2
                          : _pageController.jumpToPage(2);


                      debugPrint('value of pagerr ${_getXController.pagers.value}  ');

                    },
                  ),
                  StepperComponent(
                    currentIndex: _getXController.pagers.value,
                    index: 3,
                    title: allPageName[3],
                    onTap: () {
                      // setState(() {
                      _getXController.pagers.value = 3;
                      // });
                      _getXController.pagers.value == 3
                          ? _getXController.pagers.value = 3
                          : _pageController.jumpToPage(3);



                      debugPrint('value of pagerr ${_getXController.pagers.value}  ');

                    },
                  ),
                  StepperComponent(
                    currentIndex: _getXController.pagers.value,
                    index: 4,
                    title: allPageName[4],
                    onTap: () {
                      // setState(() {
                      _getXController.pagers.value = 4;
                      // });
                      _getXController.pagers.value == 4
                          ? _getXController.pagers.value = 4
                          : _pageController.jumpToPage(4);


                      debugPrint('value of pagerr ${_getXController.pagers.value}  ');

                    },
                  ),
                  StepperComponent(
                    currentIndex: _getXController.pagers.value,
                    isLast: true,
                    index: 5,
                    title: allPageName[5],
                    onTap: () {
                      // setState(() {
                      _getXController.pagers.value = 5;
                      // });
                      _getXController.pagers.value == 5
                          ? _getXController.pagers.value = 5
                          : _pageController.jumpToPage(5);

                      debugPrint('value of pagerr ${_getXController.pagers.value}  ');

                    },
                  ),
                ],
              ).paddingOnly(top: 15, bottom: 20),
            ),
          ),
          Obx(() {
            return Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  allPages[_getXController.pagers.value],
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

class StepperComponent extends StatelessWidget {
  // index describe the position of our bubble
  int index;
  //currentIndex is index that is gonna change on Tap
  int currentIndex;
  //onTap CallBack
  VoidCallback onTap;
  // Each page title
  String title;
  bool isLast;
  bool isFirst;

  StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.title,
    required this.onTap,
    this.isFirst = false,
    this.isLast = false,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      
      width: 90,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: Obx((){
        return  Column(
          children: [
            Row(
              children: [
                isFirst
                    ? Expanded(
                  child: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),
                )
                    : Expanded(
                  child: Container(
                    height: 2,
                    color: isFirst
                        ? Colors.red
                        : _getXController.pagers.value >= index
                        ? AppColors.primary
                        : AppColors.shadow,
                  ),
                ),
                //this is the bubble
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: _getXController.pagers.value >= index + 1
                          ? AppColors.primary
                          : AppColors.white,
                      border: Border.all(
                          color: _getXController.pagers.value >= index
                              ? AppColors.primary
                              : AppColors.shadow),
                    ),
                    child: _getXController.pagers.value >= index + 1
                        ? const Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 12,
                    )
                        : const Text(''),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    color: isLast
                        ? Colors.transparent
                        : _getXController.pagers.value >= index + 1
                        ? AppColors.primary
                        : AppColors.shadow,
                  ),
                ),
              ],
            ),
            Text(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w400,
                // overflow: TextOverflow.ellipsis,
                color: _getXController.pagers.value >= index
                    ? AppColors.primary
                    : AppColors.subtitle,
              ),
            ).pOnly(right: 2, top: 10),
          ],
        );
      })
    );
  }
}
