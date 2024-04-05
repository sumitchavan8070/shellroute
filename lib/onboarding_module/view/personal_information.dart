// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/text_form_validator.dart';
import '../components/add_alternate_enter_form.dart';
import '../components/date_enter_form.dart';
import '../components/dropdown_selection.dart';
import '../components/editable_enterform.dart';
import '../components/gender_selection.dart';
import '../components/proceed_button.dart';
import '../components/snackbar_provider.dart';
import '../components/yes_no_expansion.dart';
import '../controller/getx_controller.dart';

GetController _getXController = Get.find<GetController>();

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => PersonalInformationState();
}

//! controllers
final TextEditingController name = TextEditingController();
final TextEditingController phone = TextEditingController(text: "1320001234");
final TextEditingController countryCode = TextEditingController();
final TextEditingController alternatePhone = TextEditingController();

final TextEditingController email =
    TextEditingController(text: "rekop20695@rc3s.com");
final TextEditingController secondaryEmail = TextEditingController();
final TextEditingController passportStatus = TextEditingController();
final TextEditingController passportNumber = TextEditingController();
final TextEditingController passportExpiry = TextEditingController();
final TextEditingController birthDate = TextEditingController();
final TextEditingController nationality = TextEditingController();
final TextEditingController city = TextEditingController();
int index = 0;

class PersonalInformationState extends State<PersonalInformation> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _getXController.values(
        key: 'phone',
        value: phone.text,
        map: _getXController.personalInformation);

    _getXController.values(
        key: 'email',
        value: email.text,
        map: _getXController.personalInformation);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              EditableEnterForm(
                inputFormatters: <TextInputFormatter>[
                  OnlyCharactersFormatter()
                ],
                lableText: "Full Name (As Per Passport Name)",
                controller: name,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return "Enter this field";
                  }
                  return null;
                },
                onChanged: (value) {
                  _getXController.values(
                      key: 'name',
                      value: value,
                      map: _getXController.personalInformation);
                },
              ),
              AddAlternateMobileNoEnterForm(
                lableText: "Mobile number",
                controller: phone,
                controller2: alternatePhone,
                value: "Number",
              ),
              AddAlternateEmailIdEnterForm(
                lableText: "Email",
                controller2: secondaryEmail,
                controller: email,
                value: "Email",
              ),
              const Gender(),
              YesNoExpansion(
                lableText: "Do you have Passport?",
                controller: passportStatus,
                controller1: passportNumber,
                controller2: passportExpiry,
              ).pOnly(bottom: 18),
              DateEnterForm(
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter this field";
                    }
                    return null;
                  },
                  lableText: "Date of Birth",
                  controller: birthDate,
                  mapName: _getXController.personalInformation,
                  value: 'birth_date')
                  .pOnly(bottom: 18),
              DropDownSelection(
                mapKeyName: 'country_id',
                filtertext: 'Nationality',
                lableText: "Select Your Nationality",
                lists: _getXController.state?.countries,
                mapKey: 'country_name',
                mapName: _getXController.personalInformation,
              ).pOnly(bottom: 18),
              DropDownSelection(
                mapKeyName: 'city_id',
                filtertext: 'City',
                lableText: "Select Your City",
                lists: const ['Indore','Pune','Jaipur','USA','UK',],
                mapKey: 'city_name',
                mapName: _getXController.personalInformation,
              ),
              const SizedBox(height: 25,),

              ProceedSkipButton(
                pageIndex: index,
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    String? statusCode;
                    String? status;
                    debugPrint("Post Start");
                    _getXController.isLoading.value = true;
                    Map<String, dynamic> message =
                    await postDataInstance.onBoardingQuesApiPost(
                      endpoint: '/store_onboard',
                      postData: _getXController.personalInformation,
                    );
                    _getXController.isLoading.value = false;
                    statusCode = message['status'];
                    status = message['message'].toString();
                    if (statusCode == 1) {
                      debugPrint('Post Successes!!!!');
                      snackbar(context, status);
                      if (_getXController.pagers.value < 5 &&
                          _getXController.pagers.value == 0) {
                        _getXController.pagers.value =
                            _getXController.pagers.value + 1;
                      } else {
                        debugPrint('error in the page view !!');
                      }
                    } else {
                      _getXController.isLoading.value = false;
                      debugPrint('Post Fails !!1');
                      snackbar(context, status.toString());
                    }
                    _getXController.isLoading.value = false;
                  }
                },
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

              ),
              // Obx(
              //   () => Text(
              //       "${_getXController.personalInformation}"),
              // ),
            ],
          ),
        ),

        // _getXController.obx(
        //   (state) {
        //     return Form(
        //       key: _formKey,
        //       child: Column(
        //         children: [
        //           EditableEnterForm(
        //             inputFormatters: <TextInputFormatter>[
        //               OnlyCharactersFormatter()
        //             ],
        //             lableText: "Full Name (As Per Passport Name)",
        //             controller: name,
        //             validator: (value) {
        //               if (value?.isEmpty ?? false) {
        //                 return "Enter this field";
        //               }
        //               return null;
        //             },
        //             onChanged: (value) {
        //               _getXController.values(
        //                   key: 'name',
        //                   value: value,
        //                   map: _getXController.personalInformation);
        //             },
        //           ),
        //           AddAlternateMobileNoEnterForm(
        //             lableText: "Mobile number",
        //             controller: phone,
        //             controller2: alternatePhone,
        //             value: "Number",
        //           ),
        //           AddAlternateEmailIdEnterForm(
        //             lableText: "Email",
        //             controller2: secondaryEmail,
        //             controller: email,
        //             value: "Email",
        //           ),
        //           const Gender(),
        //           YesNoExpansion(
        //             lableText: "Do you have Passport?",
        //             controller: passportStatus,
        //             controller1: passportNumber,
        //             controller2: passportExpiry,
        //           ).pOnly(bottom: 18),
        //           DateEnterForm(
        //                   validator: (value) {
        //                     if (value?.isEmpty ?? false) {
        //                       return "Enter this field";
        //                     }
        //                     return null;
        //                   },
        //                   lableText: "Date of Birth",
        //                   controller: birthDate,
        //                   mapName: _getXController.personalInformation,
        //                   value: 'birth_date')
        //               .pOnly(bottom: 18),
        //           DropDownSelection(
        //             mapKeyName: 'country_id',
        //             filtertext: 'Nationality',
        //             lableText: "Select Your Nationality",
        //             lists: _getXController.state?.countries,
        //             mapKey: 'country_name',
        //             mapName: _getXController.personalInformation,
        //           ).pOnly(bottom: 18),
        //           DropDownSelection(
        //             mapKeyName: 'city_id',
        //             filtertext: 'City',
        //             lableText: "Select Your City",
        //             lists: const ['Indore','Pune','Jaipur','USA','UK',],
        //             mapKey: 'city_name',
        //             mapName: _getXController.personalInformation,
        //           ),
        //           const SizedBox(height: 25,),
        //
        //           ProceedSkipButton(
        //             pageIndex: index,
        //             onPressed: () async {
        //               if (_formKey.currentState?.validate() ?? false) {
        //                 String? statusCode;
        //                 String? status;
        //                 debugPrint("Post Start");
        //                 _getXController.isLoading.value = true;
        //                 Map<String, dynamic> message =
        //                     await postDataInstance.onBoardingQuesApiPost(
        //                   endpoint: '/store_onboard',
        //                   postData: _getXController.personalInformation,
        //                 );
        //                 _getXController.isLoading.value = false;
        //                 statusCode = message['status'];
        //                 status = message['message'].toString();
        //                 if (statusCode == 1) {
        //                   debugPrint('Post Successes!!!!');
        //                   snackbar(context, status);
        //                   if (_getXController.pagers.value < 5 &&
        //                       _getXController.pagers.value == 0) {
        //                     _getXController.pagers.value =
        //                         _getXController.pagers.value + 1;
        //                   } else {
        //                     debugPrint('error in the page view !!');
        //                   }
        //                 } else {
        //                   _getXController.isLoading.value = false;
        //                   debugPrint('Post Fails !!1');
        //                   snackbar(context, status.toString());
        //                 }
        //                 _getXController.isLoading.value = false;
        //               }
        //             },
        //             onPressedSkip: () {
        //               if (_getXController.pagers.value < 5) {
        //                 _getXController.pagers.value =
        //                     _getXController.pagers.value + 1;
        //               } else {
        //                 debugPrint('page view fails');
        //               }
        //               snackbar(context, ' add error pop up for already exiting qualification.');
        //               // if (_getXController.pagger.value >= 5) {
        //               //   _getXController.pagger.value = 0;
        //               // } else {
        //               //   debugPrint('error in the page view !!');
        //               // }
        //             },
        //
        //           ),
        //           // Obx(
        //           //   () => Text(
        //           //       "${_getXController.personalInformation}"),
        //           // ),
        //         ],
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
