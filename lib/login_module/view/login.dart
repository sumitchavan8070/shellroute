import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/text_styles.dart';
import 'package:testinggetx/login_module/components/social_button.dart';
import 'package:testinggetx/login_module/components/tabbar.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        controller.phoneNumberError.value = '';
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 10,),
              Text("Login to Continue",
                style: title
              ).pOnly(top: 55),

              Text(
                "Your hassle free journey to studying abroad starts here!",
                maxLines: 2,
                style: subtitle,
              ).paddingOnly(top: 20, bottom: 30),
              const LoginTabbar(),
              const SocaialButton(),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: "Don’t have an account? ",style:blackText,
                      children: [
                        TextSpan(
                            text: 'Sign Up Here',
                            style: linkText,
                            recognizer: TapGestureRecognizer()..onTap=(){
                              context.pushReplacement("/signup");
                            }
                        ),
                      ]
                  ),
                ),
              ),

            ],
          ),
        ).pSymmetric(h: 15, v: 10),
      ),
    );
  }
}
