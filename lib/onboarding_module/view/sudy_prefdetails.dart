
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/text_form_validator.dart';
import '../components/enter_form_field.dart';
import '../components/choice.dart';
import '../components/multiple_selection_container.dart';
import '../components/normal_dropdown.dart';
import '../components/proceed_button.dart';
import '../components/snackbar_provider.dart';
import '../controller/getx_controller.dart';

class StudyAbroadPref extends StatefulWidget {
  const StudyAbroadPref({super.key});

  @override
  State<StudyAbroadPref> createState() => _StudyAbroadPrefState();
}

GetController _getXController = Get.find<GetController>();

//! controllers
final TextEditingController preferredCountry = TextEditingController();
final TextEditingController preferredCourse = TextEditingController();
final TextEditingController appliedUniversityName = TextEditingController();
final TextEditingController consultantName = TextEditingController();
final TextEditingController intakeYears = TextEditingController();
final TextEditingController intakeSessions = TextEditingController();

var index = 1;

class _StudyAbroadPrefState extends State<StudyAbroadPref> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MultipleSelectionContainer(
                lableText: "Countries you aspire to study in ?",
                controller: preferredCountry,
              ).pOnly(bottom: 10),
              MultipleDropDown(
                filtertext: 'Select Course',
                lableText: 'Preferred Course',
                lists: _getXController.state?.courses,
                mapKey: 'preferred_course',
                mapName: _getXController.studyAbroadPref,
              ).pOnly(bottom: 25),
              Obx(
                    () {
                  return Column(
                    children: [
                      NormalDropDown(
                        filtertext: '',
                        lableText: 'Applied to any University yet',
                        lists: const [
                          'Applied to any University yet',
                          'Yes',
                          'No'
                        ],
                        mapKey: 'applied_university_status',
                        mapName: _getXController.studyAbroadPref,
                      ).pOnly(top: 0, bottom: 25),
                      if (_getXController.studyAbroadPref[
                      'applied_university_status'] ==
                          'Yes') ...[
                        enterFormField(
                          inputFormatters: [OnlyCharactersFormatter()],
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter this field";
                            }
                            return null;
                          },
                          lableText: 'Name of University',
                          onChanged: (value) {
                            _getXController.values(
                              key: 'applied_university_name',
                              value: value,
                              map: _getXController.studyAbroadPref,
                            );
                          },
                        ),
                      ],
                      NormalDropDown(
                        filtertext: '',
                        lableText: 'Connected to any other consultant',
                        lists: const [
                          'Connected to any other consultant',
                          'Yes',
                          'No'
                        ],
                        mapKey: 'consultant_status',
                        mapName: _getXController.studyAbroadPref,
                      ).pOnly(top: 20, bottom: 25),
                      if (_getXController
                          .studyAbroadPref['consultant_status'] ==
                          'Yes') ...[
                        enterFormField(
                          inputFormatters: [OnlyCharactersFormatter()],
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter this field";
                            }
                            return null;
                          },
                          lableText: 'Name of Consultant',
                          onChanged: (value) {
                            _getXController.values(
                              key: 'consultant_name',
                              value: value,
                              map: _getXController.studyAbroadPref,
                            );
                          },
                        )
                      ]
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              YearSelectMultiple(
                  lableText: 'In which year are you planning to go abroad?',
                  controller: intakeYears,
                  listsYear: const ['2023', '2024', '2025']),
              const SizedBox(
                height: 25,
              ),
              IntakeSelectMultiple(
                lableText:
                'Which intake session are you planning to go in?',
                controller: intakeSessions,
              ),
              const SizedBox(
                height: 25,
              ),
              ProceedSkipButton(
                pageIndex: index,
                onPressedSkip: () {
                  if (_getXController.pagers.value < 5) {
                    _getXController.pagers.value =
                        _getXController.pagers.value + 1;
                  } else {
                    debugPrint('page view fails');
                  }
                  // snackbar(context, ' add error pop up for already exiting qualification.');
                  // if (_getXController.pagger.value >= 5) {
                  //   _getXController.pagger.value = 0;
                  // } else {
                  //   debugPrint('error in the page view !!');
                  // }
                },

                onPressed: () async {
                  String? code;
                  String? status;
                  if (_formKey.currentState?.validate() ?? false) {
                    debugPrint("post start");
                    _getXController.isLoading.value = true;
                    // code = message['status'];
                    // status = message['message'];
                    _getXController.isLoading.value = false;


                    if (code == 1 as String) {
                      debugPrint('successs!!!!');
                      snackbar(context, status!);
                      // TODO: add error pop up for already exiting qualification.
                      if (_getXController.pagers.value < 5) {
                        _getXController.pagers.value =
                            _getXController.pagers.value + 1;
                      } else {
                        debugPrint('page view fails');
                      }
                    } else {
                      debugPrint('post request fail !! ');
                      // snackbar(context, status.toString());
                      snackbar(context, "Token Invalid");
                    }
                  } else {
                    debugPrint('validation fails!!!!');
                  }
                  _getXController.isLoading.value = false;
                },

              ),
              // Obx(
              //   () => Text(" ${_getXController.studyAbroadPref}",),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
