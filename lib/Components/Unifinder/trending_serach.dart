import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/constants/text_styles.dart';

import '../../Controller/getx_main_controller.dart';

class TrendingSearches extends StatelessWidget {
  const TrendingSearches({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/images/trending.svg"),
            const SizedBox(width: 5,),
            Text("Trending Searches", style: eventTitle,)
          ],
        ).paddingOnly(bottom: 10),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.trending.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Text(controller.trending[index],style:eventSubtitle,).paddingSymmetric(vertical: 2);
          },
          separatorBuilder: (context, index) {
            return Divider(color: AppColors.subtitle.withOpacity(0.2),thickness: 1,);
          },
        )
      ],
    );
  }
}
