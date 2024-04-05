import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/constants/text_styles.dart';

import '../../Controller/getx_main_controller.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<getXMainController>();
    GetXMainController controller = Get.put(GetXMainController());

    return Obx(
      () => controller.recentsarch.isEmpty == true?Container():
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/recentsearch.svg"),
                      const SizedBox(width: 10,),
                      Text("Recent Searches", style: eventTitle,)
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        controller.recentsarch.clear();
                      },
                      child: Text("Clear All", style: underlineLinkText,))
                ],
              ).paddingOnly(bottom: 15, top: 20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.recentsarch.length,
                itemBuilder: (context, index) {
                  return Text("${controller.recentsarch[index]}", style: eventSubtitle,).paddingOnly(bottom: 5, top: 0);
                },
              ),


            ],
          ),
    ).paddingOnly(bottom: 20, top: 10);
  }
}
