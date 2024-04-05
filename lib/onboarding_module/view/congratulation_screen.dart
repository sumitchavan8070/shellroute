import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:testinggetx/routes/go_routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/app_colors.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}
final controller = Get.put(GetXMainController());
class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 170.18,
                  height: 53,
                  child: SvgPicture.asset('assets/images/logo.svg'),
                ),
                const HeightBox(30),
                SizedBox(
                  child: SvgPicture.asset('assets/images/congra.svg'),
                ),
                const HeightBox(20),
                Column(
                  children: [
                    SizedBox(
                      child: SvgPicture.asset('assets/images/mark.svg'),
                    ),
                    const HeightBox(20),
                    const SizedBox(
                      child: Text(
                        'Congratulations!!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF24292D),
                          fontSize: 22,
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w500,
                          height: 1.18,
                        ),
                      ),
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
                    )
                  ],
                )
              ],
            ),
            const HeightBox(30),
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
                      onPressed: () async{
                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.setBool(controller.onboardOver.value, true);
                        goRouter.go(GoPath.tabBarDocs);
                      },
                      child: const Text(
                        "Go to dashboard",
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
    );
  }
}
