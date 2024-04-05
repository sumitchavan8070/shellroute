import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/text_styles.dart';
import '../components/sign_up_items.dart';
import '../components/social_button.dart';
class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child:  Text("Sign Up",
                  style: title,
                ).pOnly(top: 55),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Your hassle free journey to studying abroad starts here!",
                    maxLines: 2,
                    style: subtitle,
                  )
                ).pOnly(top: 20, bottom: 20),
              const SignUpItems(),
              const SocaialButton(),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: "Already have an account? ",style: blackText,
                      children: [
                        TextSpan(
                            text: 'Login Here',
                            style: linkText,
                            recognizer: TapGestureRecognizer()..onTap=(){
                              context.pushNamed(GoPath.login);
                            }
                        ),
                      ]
                  ),
                ),
              ),

            ],
          ),
        ),
      ).pSymmetric(h: 15, v: 10),
    );
  }
}
