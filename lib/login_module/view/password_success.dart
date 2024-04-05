import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/text_styles.dart';
import '../components/button.dart';
import '../components/login_appbar.dart';

class PasswordSuccess extends StatelessWidget {
  const PasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset("assets/images/Registration/passwordsuccess.svg",
                  )
              ).paddingAll(25),
              Text("Password has been\nchanged successfully!!! ",
                textAlign: TextAlign.center,
                style: successTitle,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "Your have just reset your Password!\nClick on the button below to login with your new password",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: subtitle,
                  )
              ).pSymmetric(v: 10),
              const SizedBox(height: 100,),
              SubmitButton(
                title: "Login Now ",
                onPressed: () {
                  context.go(GoPath.login);
                },
              ).pSymmetric(v: 30),
            ],
          ),
        ),
      ).pSymmetric(h: 10, v: 10),
    );
  }
}
