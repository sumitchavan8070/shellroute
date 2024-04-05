import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/text_styles.dart';
import '../components/button.dart';
import '../components/enter_form_field.dart';
import '../../constants/text_form_validator.dart';
import '../components/login_appbar.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const LoginAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.36,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset("assets/images/Registration/craetepasswprd.svg",
                )
            ).paddingAll(25),
            Text("Create New Password",
                style: title
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "New Password must be different from the last one",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: subtitle,
                )
            ).paddingOnly(top: 5),
            Form(
              key: formKey,
              child: Column(
                children: [
                  EnterPasswordField(
                    inputFormatters: [AlphanumericFormatter()],
                    validator:(value) {
                      if(value?.isEmpty ?? false){
                        return "Enter password";
                      }
                      return null;
                    },
                    lableText: "Password",
                    controller: passwordController,
                    obscureText: true,
                  ).pSymmetric(v: 10, h: 5),
                  EnterPasswordField(
                    inputFormatters: [AlphanumericFormatter()],
                    validator:(value) {
                      if(value?.isEmpty ?? false){
                        return "Enter Confirm password";
                      }
                      else if(value != passwordController.text)
                        {
                          return "Password not match";

                        }
                      return null;
                    },
                    lableText: "Confirm Password",
                    controller: cPasswordController,
                    obscureText: true,
                  ).pSymmetric(h: 5),
                ],
              ),
            ),
            SubmitButton(
              title: "Save Password ",
              onPressed: () {
                if(formKey.currentState?.validate() ?? false){
                  context.pushNamed(GoPath.successPassword);
                }
              },
            ).pSymmetric(v: 40),
            keyboardIsOpen
                ? SizedBox(height: MediaQuery.of(context).size.height * 0.30,)
                : const SizedBox(height: 0,)
          ],
        ),
      ).pSymmetric(h: 15, v: 10),
    );
  }
}
