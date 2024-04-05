import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Components/Drawer/features.dart';
import 'package:testinggetx/Components/Drawer/logout.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/text_styles.dart';
import 'drawer_grid.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key,});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return SafeArea(
      child: Drawer(
        // key: controller.scaffoldKeyDrawer,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF066AC9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset("assets/images/Drawer/glogo.svg",).paddingAll(3),
                ),
                const SizedBox(width: 5,),
                Text("Hi Priya!",
                  style: blackName
                ),
              ],
            ).pSymmetric(v: 10, h: 10),
            const DrawerGrid(),
            Features(title: 'FEATURES', list: controller.features,),
            Features(title: 'RESOURCES', list: controller.resources,),
            const Logout()
          ],
        ).paddingSymmetric(horizontal: 5),
      ),
    );
  }
}