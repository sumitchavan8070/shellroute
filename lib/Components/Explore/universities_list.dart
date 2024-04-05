import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/text_styles.dart';
import 'explore_dropdown_button.dart';

class UniversitiesList extends StatefulWidget {
  const UniversitiesList({super.key});

  @override
  State<UniversitiesList> createState() => _UniversitiesListState();
}
 final controller = Get.put(GetXMainController());
class _UniversitiesListState extends State<UniversitiesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sort By",style: blackName,),
            const WidthBox(15),
            ExploreDropDownButton(title: "Tuition Fees")

          ],
        ),
        // SvgPicture.asset("assets/images/noData.svg").paddingOnly(top: 30),
        // SizedBox(
        //   width:MediaQuery.of(context).size.width * 0.7,
        //   child: Text("We left no stones unturned! We couldn't find the universities you're looking for",
        //     style: blackName,
        //     maxLines: 4,
        //     textAlign: TextAlign.center,
        //   ),
        // ).paddingOnly(top: 20),
        // SizedBox(
        //   width:MediaQuery.of(context).size.width * 0.7,
        //   child: Text("Try changing the filters to modify your search.",
        //     style: subtitle,
        //     maxLines: 2,
        //     textAlign: TextAlign.center,
        //   ),
        // ).paddingOnly(top: 20),
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.selectedCountry.isEmpty?12:controller.selectedCountry.length*2,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadow,
                    spreadRadius: 0,
                    blurRadius: 6,
                    offset: Offset(0,0),
                  )
                ],
                borderRadius: BorderRadius.circular(12)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle
                                ),
                                child: Image.asset("assets/images/university.png", fit: BoxFit.fill,),
                              ).paddingOnly(right: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.55,
                                    child: Text("University of Texas at Austin",
                                      style: eventTitle,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text("Texas, United States", style: eventSubtitle,)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ).paddingSymmetric(vertical: 5, horizontal: 15),
                      Divider(
                        color: AppColors.subtitle.withOpacity(0.2),height: 1,thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.courses.isEmpty
                          ?Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Average Tuition Fee", style: eventSubtitle,),
                              const HeightBox(5),
                              Text("\$150-\$200", style: linkText,),

                            ],
                          )
                          :Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Course Name", style: eventSubtitle,),
                              const HeightBox(5),
                              Text(controller.courses[0].toString(), style: linkText,),

                              const SizedBox(height: 20,),

                              Text("Average Tuition Fee", style: eventSubtitle,),
                              const HeightBox(5),
                              Text("\$150-\$200", style: linkText,),

                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.subtitle.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Center(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/images/watchlist.svg"),
                                      const WidthBox(10),
                                      Text("Watchlist", style: subtitle,),
                                    ],
                                  )
                                )
                              )
                            ],
                          ),                      ],
                      ).paddingOnly(bottom: 10, top: 10)
                    ],
                  )
                ],
              ),
            );
          },
        ).paddingSymmetric(horizontal: 20, vertical: 20),
      ],
    );
  }
}
