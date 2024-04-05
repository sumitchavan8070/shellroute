import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';

import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';


class DrawerGrid extends StatelessWidget {
   const DrawerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 15.0, // spacing between rows
          crossAxisSpacing:15.0, // spacing between columns
          mainAxisExtent: 70, // grid size
          childAspectRatio: 5.0
        ),
        padding: const EdgeInsets.all(8.0), // padding around the grid
        itemCount: controller.users.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: AppColors.appBar,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(controller.users[index].svg),
                Text(controller.users[index].name,
                  style: blackText
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
