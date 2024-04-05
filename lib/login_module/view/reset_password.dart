import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/text_styles.dart';
import '../components/button.dart';
import '../components/login_appbar.dart';
import '../components/phone_no_country_code.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}
final controller = Get.put(GetXMainController());
class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset("assets/images/Registration/reset.svg",
                  )
              ).paddingAll(25),
              Text("Reset Password?",
                style: title,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Please enter you mobile number to receive a verification code",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: subtitle,
                  )
              ).paddingOnly(top: 10, bottom: 30),
              Obx(
                    () =>
                    PhoneNoEnterForm(
                        autofocus: true,
                        errorText: controller.phoneNumberError
                            .value == '' ? null : controller
                            .phoneNumberError.value,
                        keyboardType: TextInputType.phone,
                        lableText: "Mobile Number",
                        hintText: "Mobile Number",
                        controller: phoneController,
                        onChanged: (phoneNumber) {
                          controller.validatePhone(number: phoneNumber);
                          // numberValidator(number: phoneNumber);
                        },
                        validator: (phoneNumber) {
                          controller.validatePhone(number: phoneNumber?.number);
                          return null;
                          // numberValidator(
                          //     number: phoneNumber?.number);
                        }),
              ).pOnly(bottom: 30),
              const SizedBox(height: 70,),
              SubmitButton(title: "Send OTP",
                onPressed: () {
                  if (phoneController.text.length == 10 ) {
                    context.pushNamed(GoPath.otp, pathParameters: {'number': phoneController.text});
                  }

                // if(resetFormKey.currentState!.validate() || passwordController.text.length != 10){
                //   return;
                // }
                // else {
                //   context.pushNamed(GoPath.otp, pathParameters: {'number': passwordController.text});
                // }
                },
              ),
            ],
          ),
        ),
      ).pSymmetric(h: 10, v: 10),
    );
  }
}
