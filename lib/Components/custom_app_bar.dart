import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../Controller/getx_main_controller.dart';
import '../routes/go_path.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());

    return

      AppBar(
      backgroundColor: const Color(0xFFE6F0F9),
      automaticallyImplyLeading: false,
      centerTitle: true,
      toolbarHeight: 65,
      elevation: 4,
      title: SvgPicture.asset("assets/images/logo.svg"),
      leading: InkWell(
        onTap: () {
          controller.openDrawer();
        },
        child:
        Container(
            decoration: BoxDecoration(
              color: const Color(0xFF066AC9),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 25,
            width: 35,
            child: Center(
                child: SvgPicture.asset(
                  "assets/images/drawer.svg",
                  fit: BoxFit.fill,
                )
            )
        ).paddingOnly(left: 17, top: 10, bottom: 12),
      ),
      actions: [
        GestureDetector(
            onTap: () {
              context.pushNamed(GoPath.profile);
            },
            child: SvgPicture.asset("assets/images/profile.svg").paddingOnly(right: 10,)),
      ],
    ) ;
  }
}
