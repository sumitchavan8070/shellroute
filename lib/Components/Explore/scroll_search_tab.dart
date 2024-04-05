import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/app_colors.dart';

import '../../routes/go_path.dart';
import 'explore_dropdown_button.dart';

class ScrollSearchTab extends StatefulWidget {
  const ScrollSearchTab({super.key});

  @override
  State<ScrollSearchTab> createState() => _ScrollSearchTabState();
}

class _ScrollSearchTabState extends State<ScrollSearchTab> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Row(
          children: [
            const SizedBox(width: 20,),
            ExploreDropDownButton(
              title: "Country",
              onTap: () {
                context.pushNamed(GoPath.searchCountry);
              },
              color: controller.selectedCountry.isNotEmpty?AppColors.appBar:AppColors.white,
            ),
            ExploreDropDownButton(
              title: "Course",
              onTap: () {
                context.pushNamed(GoPath.searchCourse);
              },
              color: controller.courses.isNotEmpty?AppColors.appBar:AppColors.white,
            ),
            ExploreDropDownButton(title: "University Type"),
            ExploreDropDownButton(title: "University Rank")
          ],
        ),
      ),
    );
  }
}
