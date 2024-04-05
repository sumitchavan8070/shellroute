import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/text_styles.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/app_colors.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final controller = Get.put(GetXMainController());
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height *0.44,
      width: MediaQuery.of(context).size.width *0.95,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(color: AppColors.subtitle.withOpacity(0.4))
          boxShadow: [
            BoxShadow(
                color: AppColors.subtitle.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1)
            )
          ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/images/upcoming.svg").paddingOnly(right: 10),
                  Text("Upcoming Events",style: smallTitle,)
                ],
              ),
              Text("View All", style: underlineLinkText,)
            ],
          ).pSymmetric(h: 10),
          Divider(color: AppColors.subtitle.withOpacity(0.5),thickness: 0.7,),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  // height: MediaQuery.of(context).size.height*.165,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.subtitle.withOpacity(0.3))
                    // color: Colors.red
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     SizedBox(
                       width: MediaQuery.of(context).size.width * 0.9,
                       child: Text(controller.data[index].title,
                         style: blackText,
                         maxLines: 3,
                       ),
                     ).paddingOnly(bottom: 5),
                     Text(controller.data[index].date,
                       style: eventSubtitle,
                     ),
                     Text(controller.data[index].time,
                       style: eventSubtitle,
                     ),
                     Align(
                       alignment: Alignment.centerRight,
                       child: Text(
                         "Book a Free Seat",
                         style: eventLinkText,
                       ).paddingOnly(top: 5, bottom: 5),
                     )
                    ],
                  ),
                ).paddingSymmetric(horizontal: 10);
              }
          ),
        ],
      ),

    ).pSymmetric(v: 15, h:15);
  }
}
