import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/login_module/components/phone_no_country_code.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/text_form_validator.dart';
import '../../routes/go_path.dart';
import 'button.dart';
import 'enter_form_field.dart';

class SignUpItems extends StatefulWidget {
  const SignUpItems({super.key});

  @override
  State<SignUpItems> createState() => _SignUpItemsState();
}
final controller = Get.put(GetXMainController());
class _SignUpItemsState extends State<SignUpItems> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: signupFormKey,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex:3,
                  child: EnterFormField(
                    inputFormatters: [OnlyCharactersFormatter()],
                    controller: firstname,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter First Name";
                      }
                      return null;
                    },
                    lableText: 'Enter First Name',
                  ).pOnly(top: 3),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex:3,
                  child: EnterFormField(
                    inputFormatters: [OnlyCharactersFormatter()],
                    controller: lastname,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter Last Name";
                      }
                      return null;
                    },
                    lableText: 'Enter Last Name',
                  ).pOnly(top: 3),
                ),

              ],
            ),
            EnterFormField(
              inputFormatters: [EmailAndDomainFormatter()],
              controller: email,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return "Enter Email Id";
                }
                return null;
              },
              lableText: 'Enter Email Id',
            ),
            Obx(
                  () =>
                  PhoneNoEnterForm(
                      errorText: controller.phoneNumberError
                          .value == '' ? null : controller
                          .phoneNumberError.value,
                      keyboardType: TextInputType.phone,
                      lableText: "Mobile Number",
                      hintText: "Mobile Number",
                      controller: mobileController,
                      onChanged: (phoneNumber) {
                        controller.validatePhone(number: phoneNumber);
                      },
                      validator: (phoneNumber) {
                        controller.validatePhone(number: phoneNumber?.number);
                        return null;
                      }),
            ).paddingOnly(bottom: 20),

            SubmitButton(title: "Submit",
              onPressed: () {
              if(signupFormKey.currentState!.validate()){
                context.pushNamed(GoPath.otp, pathParameters: {'number': mobileController.text});
              }
              },
            ),

          ],
        ),
      ),
    );
  }
}
