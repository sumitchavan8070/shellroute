import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/constants/text_styles.dart';

class Finder extends StatelessWidget {
  const Finder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.44,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.appBar.withOpacity(0.4),
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/uniersity-finder.svg"),
                const SizedBox(height: 8,),
                Text("University Finder", style: blackText,)
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.44,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
            decoration: BoxDecoration(
              color: AppColors.appBar.withOpacity(0.4),
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/course-finder.svg"),
                const SizedBox(height: 8,),
                Text("Course Finder", style: blackText,)
              ],
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 15, vertical: 12),
    );
  }
}
