// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/text_form_validator.dart';
import '../components/enter_form_field.dart';
import '../components/date_enter_form.dart';
import '../components/normal_dropdown.dart';
import '../components/proceed_button.dart';
import '../components/snackbar_provider.dart';
import '../controller/getx_controller.dart';

class TestBudget extends StatefulWidget {
  const TestBudget({super.key});

  @override
  State<TestBudget> createState() => _TestBudgetState();
}

final TextEditingController english_score = TextEditingController();
final TextEditingController english_result_date = TextEditingController();
final TextEditingController aptitude_score = TextEditingController();
final TextEditingController aptitude_result_date = TextEditingController();

GetController _getXController = Get.find<GetController>();
int index = 5;

class _TestBudgetState extends State<TestBudget> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Obx(
                () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select your English Proficiency Exam',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Heebo'),
                ),
                const SizedBox(height: 25),
                NormalDropDown(
                  filtertext: 'Exam Name',
                  lableText: 'Select your English Proficiency Exam',
                  lists: const [
                    "Select your English Proficiency Exam",
                    'IELTS',
                    'TOEFL',
                    'PTE',
                    'Duolingo',
                    'None'
                  ],
                  mapKey: 'english_test',
                  mapName: _getXController.testStatus,
                ).pOnly(bottom: MediaQuery.of(context).size.height * 0.019),
                if (_getXController.testStatus['english_test'] == 'None')
                  ...[]
                else ...[
                  DateEnterForm(
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter this field";
                        }
                        return null;
                      },
                      lableText: 'Result Date',
                      mapName: _getXController.testStatus,
                      controller: english_result_date,
                      value: 'english_result_date')
                      .pOnly(
                      bottom:
                      MediaQuery.of(context).size.height * 0.019),
                  enterFormField(
                    inputFormatters: [NumberDotFormatter()],
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter this field";
                      }
                      return null;
                    },
                    lableText: 'Overall Score',
                    controller: english_score,
                    onChanged: (value) {
                      _getXController.values(
                          key: 'english_score',
                          value: value,
                          map: _getXController.testStatus);
                    },
                  ),
                ],
                const Text(
                  'Study Abroad Test',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Heebo'),
                ).pOnly(top: MediaQuery.of(context).size.height * 0.019),
                const SizedBox(height: 25),
                NormalDropDown(
                  filtertext: 'Exam Name',
                  lableText: 'Select your Study Abroad Academic Exam',
                  lists: const [
                    'Select your Study Abroad Academic Exam',
                    'SAT',
                    'ACT',
                    'GMAT',
                    'GRE',
                    'None'
                  ],
                  mapKey: 'aptitude_test',
                  mapName: _getXController.testStatus,
                ).pOnly(bottom: MediaQuery.of(context).size.height * 0.019),
                if (_getXController.testStatus['aptitude_test'] ==
                    'None') ...[
                  // Divider()
                ] else ...[
                  DateEnterForm(
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter this field";
                        }
                        return null;
                      },
                      mapName: _getXController.testStatus,
                      lableText: 'Result Date',
                      controller: aptitude_result_date,
                      value: 'aptitude_result_date')
                      .pOnly(
                      bottom:
                      MediaQuery.of(context).size.height * 0.019),
                  enterFormField(
                    inputFormatters: [NumberDotFormatter()],
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter this field";
                      }
                      return null;
                    },
                    lableText: 'Overall Score',
                    onChanged: (value) {
                      _getXController.values(
                          key: 'aptitude_score',
                          value: value,
                          map: _getXController.testStatus);
                    },
                    controller: aptitude_score,
                  )
                ],
                // Obx(
                //       () => Text('${_getXController.testStatus}'),
                // ),
                const SizedBox(height: 25,),
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
                    if (formKey.currentState?.validate() ?? false) {
                      String? statusCode;
                      String? status;
                      debugPrint("Post Start");
                      _getXController.isLoading.value = true;
                      Map<String, dynamic> message =
                      await postDataInstance.onBoardingQuesApiPost(
                        endpoint: '/store_onboard',
                        postData: _getXController.testStatus,
                      );
                      _getXController.isLoading.value = false;
                      statusCode = message['status'];
                      status = message['message'].toString();
                      if (statusCode == 1) {
                        debugPrint('Post Successes!!!!');
                        // TODO: add error pop up for already exiting qualification.
                        // adding the data for tile view RX LIST
                        snackbar(context, status);
                        if (_getXController.pagers.value >= 5) {
                          _getXController.pagers.value = 0;
                        } else {
                          debugPrint('error in the page view !!');
                        }
                      }
                      else {
                        _getXController.isLoading.value = false;
                        debugPrint('Post Fails !!1');
                        snackbar(context, status.toString());
                      }

                    } else {
                      debugPrint('post is fail validation ');
                    }
                  },
                )
              ],
            ),
          ),
        ),
        // _getXController.obx(
        //   (state) {
        //     return Form(
        //       key: _formKey,
        //       child: Obx(
        //         () => Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             const Text(
        //               'Select your English Proficiency Exam',
        //               style: TextStyle(
        //                   fontSize: 16,
        //                   fontWeight: FontWeight.w400,
        //                   fontFamily: 'Heebo'),
        //             ),
        //             const SizedBox(height: 25),
        //             NormalDropDown(
        //               filtertext: 'Exam Name',
        //               lableText: 'Select your English Proficiency Exam',
        //               lists: const [
        //                 "Select your English Proficiency Exam",
        //                 'IELTS',
        //                 'TOEFL',
        //                 'PTE',
        //                 'Duolingo',
        //                 'None'
        //               ],
        //               mapKey: 'english_test',
        //               mapName: _getXController.testStatus,
        //             ).pOnly(bottom: MediaQuery.of(context).size.height * 0.019),
        //             if (_getXController.testStatus['english_test'] == 'None')
        //               ...[]
        //             else ...[
        //               dateEnterForm(
        //                       validator: (value) {
        //                         if (value?.isEmpty ?? false) {
        //                           return "Enter this field";
        //                         }
        //                       },
        //                       lableText: 'Result Date',
        //                       mapName: _getXController.testStatus,
        //                       controller: english_result_date,
        //                       value: 'english_result_date')
        //                   .pOnly(
        //                       bottom:
        //                           MediaQuery.of(context).size.height * 0.019),
        //               enterFormField(
        //                 inputFormatters: [NumberDotFormatter()],
        //                 validator: (value) {
        //                   if (value?.isEmpty ?? false) {
        //                     return "Enter this field";
        //                   }
        //                 },
        //                 lableText: 'Overall Score',
        //                 controller: english_score,
        //                 onChanged: (value) {
        //                   _getXController.values(
        //                       key: 'english_score',
        //                       value: value,
        //                       map: _getXController.testStatus);
        //                 },
        //               ),
        //             ],
        //             const Text(
        //               'Study Abroad Test',
        //               style: TextStyle(
        //                   fontSize: 16,
        //                   fontWeight: FontWeight.w400,
        //                   fontFamily: 'Heebo'),
        //             ).pOnly(top: MediaQuery.of(context).size.height * 0.019),
        //             const SizedBox(height: 25),
        //             NormalDropDown(
        //               filtertext: 'Exam Name',
        //               lableText: 'Select your Study Abroad Academic Exam',
        //               lists: const [
        //                 'Select your Study Abroad Academic Exam',
        //                 'SAT',
        //                 'ACT',
        //                 'GMAT',
        //                 'GRE',
        //                 'None'
        //               ],
        //               mapKey: 'aptitude_test',
        //               mapName: _getXController.testStatus,
        //             ).pOnly(bottom: MediaQuery.of(context).size.height * 0.019),
        //             if (_getXController.testStatus['aptitude_test'] ==
        //                 'None') ...[
        //               // Divider()
        //             ] else ...[
        //               dateEnterForm(
        //                       validator: (value) {
        //                         if (value?.isEmpty ?? false) {
        //                           return "Enter this field";
        //                         }
        //                       },
        //                       mapName: _getXController.testStatus,
        //                       lableText: 'Result Date',
        //                       controller: aptitude_result_date,
        //                       value: 'aptitude_result_date')
        //                   .pOnly(
        //                       bottom:
        //                           MediaQuery.of(context).size.height * 0.019),
        //               enterFormField(
        //                 inputFormatters: [NumberDotFormatter()],
        //                 validator: (value) {
        //                   if (value?.isEmpty ?? false) {
        //                     return "Enter this field";
        //                   }
        //                 },
        //                 lableText: 'Overall Score',
        //                 onChanged: (value) {
        //                   _getXController.values(
        //                       key: 'aptitude_score',
        //                       value: value,
        //                       map: _getXController.testStatus);
        //                 },
        //                 controller: aptitude_score,
        //               )
        //             ],
        //             // Obx(
        //             //       () => Text('${_getXController.testStatus}'),
        //             // ),
        //             proceedSkipButton(
        //               PageIndex: index,
        //               onPressedSkip: () {
        //                 snackbar(context, ' add error pop up for already exiting qualification.');
        //                 // if (_getXController.pagger.value >= 5) {
        //                 //   _getXController.pagger.value = 0;
        //                 // } else {
        //                 //   debugPrint('error in the page view !!');
        //                 // }
        //               },
        //               onPressed: () async {
        //
        //                 if (_formKey.currentState?.validate() ?? false) {
        //                   int? statusCode;
        //                   String? status;
        //                   debugPrint("Post Start");
        //                   _getXController.isLoading.value = true;
        //                   Map<String, dynamic> message =
        //                   await postDataInstance.onBoardingQuesApiPost(
        //                     endpoint: '/store_onboard',
        //                     postData: _getXController.testStatus,
        //                   );
        //                   _getXController.isLoading.value = false;
        //                   statusCode = message['status'];
        //                   status = message['message'].toString();
        //                   if (statusCode == 1) {
        //                     debugPrint('Post Successes!!!!');
        //                     // TODO: add error pop up for already exiting qualification.
        //                     // adding the data for tile view RX LIST
        //                     snackbar(context, status);
        //                     if (_getXController.pagger.value >= 5) {
        //                       _getXController.pagger.value = 0;
        //                     } else {
        //                       debugPrint('error in the page view !!');
        //                     }
        //                   } else {
        //                     _getXController.isLoading.value = false;
        //                     debugPrint('Post Fails !!1');
        //                     snackbar(context, status.toString());
        //                   }
        //
        //                 } else {
        //                   debugPrint('post is fail validation ');
        //                 }
        //               },
        //             )
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
