import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:testinggetx/upload_documents_module/components/additional_docs/upload_button.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';


class WelcomeOnboard extends StatefulWidget {
  const WelcomeOnboard({super.key});

  @override
  State<WelcomeOnboard> createState() => _WelcomeOnboardState();
}

String name = 'Jim';

class _WelcomeOnboardState extends State<WelcomeOnboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 53,
                    child: SvgPicture.asset('assets/images/logo.svg'),
                  ),
                  const HeightBox(30),
                  Text(
                    'Hello $name,\nWelcome Onboard!!!',
                    textAlign: TextAlign.center,
                    style: bigSubtitle,
                  ),
                  const HeightBox(20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.5,

                    child: SvgPicture.asset('assets/images/welcome.svg'),
                  ),
                  const HeightBox(20),
                  SizedBox(
                    child: Text(
                      'Tell us something about yourself and\nBuild your life’s epic with Gradding!',
                      textAlign: TextAlign.center,
                      style: subtitle,
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 40),
              UploadButton(
                color: AppColors.primary,
                title: "Let's Start",
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                onPressed: () {
                  context.go(GoPath.customStepper);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
