// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:testinggetx/Components/Explore/search_container.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/login_module/components/phone_no_country_code.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../components/button.dart';
import '../components/login_appbar.dart';

class OTP extends StatefulWidget {
  const OTP({super.key, required this.number});
  final String number;

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  void initState(){
    super.initState();
    controller.startTimer();
  }

  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const LoginAppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.36,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: SvgPicture.asset("assets/images/Registration/otp.svg",
                  )
              ).paddingAll(20),
              Align(
                alignment: Alignment.center,
                child: Text("Verification Code",
                  style: title,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Please enter 4 digit code sent to:",
                  textAlign: TextAlign.center,
                  style: subtitle,
                ).pOnly(top: 10, bottom: 5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    number.toString(),
                    textAlign: TextAlign.center,
                    style: linkText,
                  ),
                  const SizedBox(width: 5,),
                  Container(height: 20,width: 20,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.appBar
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/Registration/edit.svg", height: 12,width: 12   ,),
                    ),
                  )
                ],
              ).pOnly(bottom: 30),
              Pinput(
                controller: otpcontroller,
                errorText: "Error",
                length: 4,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter OTP";
                  }
                  else{
                    return null;
                  }
                },
                androidSmsAutofillMethod:AndroidSmsAutofillMethod.smsUserConsentApi,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                keyboardType: TextInputType.number,
                autofocus: true,
                defaultPinTheme: PinTheme(
                  width: 42,
                  height: 40,
                  textStyle: bigSubtitle,
                  decoration: BoxDecoration(
                    // color: AppColors.appBar,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.subtitle.withOpacity(0.4)),
                  ),
                )
              ).pOnly(bottom: 15),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    controller.start != 0
                        ? SizedBox(
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Resend OTP in ",
                            style: blackText,),
                          Text(
                            "00: ${controller.start.toString()}",
                            style: linkText,
                          ),
                        ],
                      ).pOnly(bottom: 35),
                    )
                        : Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Didn't get it?",
                              style: blackText,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // controller.start = 30 as RxInt;
                                  controller.startTimer();
                                });
                              },
                              child: Text(
                                "Resend Code",
                            style: linkText
                              ),
                            )
                          ],
                        ).pOnly(bottom: 35),
                      ),
                    ),
                  ],
                ),
              ),
              SubmitButton(
                title: "Verify and Create",
                onPressed: () {
                  if(validateOTP(otpcontroller.text.toString())){
                    context.pushReplacementNamed(GoPath.createPassword);
                  }
                  // if (ModalRoute.of(context)?.settings.name == '/signup') {
                  //   context.pushNamed('/homepage');
                  // } {
                  // }
                },
              ).paddingOnly(top: 50),
            ],
          ),
        ),
      ).pSymmetric(h: 10, v: 10),
    );
  }


  bool validateOTP(String otp) {
    // Add your validation logic here
    // Return true if the OTP is valid, false otherwise
    return otp.length == 4; // Example: Check if OTP is exactly 4 characters long
  }




}
