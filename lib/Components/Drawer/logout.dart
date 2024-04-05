import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:testinggetx/routes/go_routes.dart';

import '../../Controller/getx_main_controller.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, ),
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.appBar,
          borderRadius: BorderRadius.circular(12)
        ),
        child: InkWell(
          onTap: () async{
            controller.closeDrawer();
            var sharedPref = await SharedPreferences.getInstance();
            sharedPref.setBool(controller.isLoggedIn.value, false);
            goRouter.go(GoPath.login);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Logout",
                style: blackName
              ),
              SvgPicture.asset("assets/images/Drawer/logout.svg",height: 20,width: 25,)
            ],
          ),
        ),
      ),
    );
  }
}
