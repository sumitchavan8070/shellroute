import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/app_colors.dart';

class WelcomeOnboard extends StatefulWidget {
  const WelcomeOnboard({super.key});

  @override
  State<WelcomeOnboard> createState() => _WelcomeOnboardState();
}

String name = 'Jim';

class _WelcomeOnboardState extends State<WelcomeOnboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 170.18,
                      height: 53,
                      child: SvgPicture.asset('assets/images/logo.svg'),
                    ),
                    const HeightBox(30),
                    Text(
                      'Hello $name,\nWelcome Onboard!!!',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.subtitle,
                        fontSize: 22,
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w500,
                        height: 1.18,
                      ),
                    ),
                    const HeightBox(20),
                    SizedBox(
                      child: SvgPicture.asset('assets/images/welcome.svg'),
                    ),
                    const HeightBox(20),
                    const SizedBox(
                      child: Text(
                        'Tell us something about yourself and\nBuild your life’s epic with Gradding!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF747579),
                          fontSize: 16,
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor:
                                  MaterialStatePropertyAll(AppColors.primary)),
                          onPressed: () {
                            context.pushNamed('/customStepper');
                          },
                          child: const Text(
                            "Let’s Start",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Heebo',
                              fontWeight: FontWeight.w500,
                              height: 1.25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
