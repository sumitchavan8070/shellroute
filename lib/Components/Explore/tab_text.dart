import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Components/Explore/universities_list.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../../routes/go_path.dart';

class TabBarDynamicListing extends StatefulWidget {
  const TabBarDynamicListing({super.key});

  @override
  State<TabBarDynamicListing> createState() => _TabBarDynamicListingState();
}

final controller = Get.put(GetXMainController());

class _TabBarDynamicListingState extends State<TabBarDynamicListing> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          if (controller.selectedCountry.isEmpty == true && controller.courses.isEmpty == true) ...[
            Text(
              "Showing 12 of 499 universities for",
              style: subtitle,
            ),
            Text(
              "All Universities and Colleges",
              style: blackName,
            ),
            Divider(color: AppColors.subtitle.withOpacity(0.3),thickness: 1,height: 1,).paddingSymmetric(vertical: 10, horizontal: 20),
            const UniversitiesList()
          ]
          else if (controller.selectedCountry.length == 1 || controller.courses.length == 1) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Showing 5 of 20 universities ",
                  style: subtitle,
                ),
                controller.courses.isEmpty
                ?controller.selectedCountry.isEmpty?const SizedBox(): Text("in",style: subtitle,)
                :Text(
                  "for",
                  style: subtitle,
                ),

              ],
            ),
            controller.courses.isEmpty
            ?const SizedBox()
            :Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.courses[0].toString(),
                  style: blueAppbarText,
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(GoPath.searchCourse);
                  },
                  child: const Icon(
                    Icons.add_circle_sharp,
                    size: 18,
                    color: AppColors.primary,
                  ).paddingOnly(left: 8)
                )

              ],
            ),

            controller.selectedCountry.isEmpty
              ?const SizedBox()
              :Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.courses.isEmpty
                  ?const SizedBox()
                  :Text("in ", style: subtitle,),

                  Text(
                    controller.selectedCountry[0].toString(),
                    style: blueAppbarText,
                  ),
                  GestureDetector(
                      onTap: () {
                        context.pushNamed(GoPath.searchCountry);
                      },
                      child: const Icon(
                        Icons.add_circle_sharp,
                        size: 18,
                        color: AppColors.primary,
                      ).paddingOnly(left: 8))

                ],
              ),

            Divider(color: AppColors.subtitle.withOpacity(0.3),thickness: 1,height: 1,).paddingSymmetric(vertical: 10, horizontal: 20),
            const UniversitiesList()
          ]
          else if(controller.selectedCountry.length >= 2)...[
            Text(
              "Showing 12 of 14 countries in",
              style: subtitle,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTabController(
                  length: controller.selectedCountry.length,
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.9 ,
                    child: TabBar(
                        dividerColor: AppColors.black,
                        isScrollable: false,
                        unselectedLabelColor: AppColors.shadow,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                        indicatorColor: Colors.transparent,
                        tabs: [
                          for (int i = 0; i < controller.selectedCountry.length; i++)
                            Tab(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = i;
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: i == 0 ? const Radius.circular(10) : Radius.zero,
                                          bottomLeft: i == 0 ? const Radius.circular(10) : Radius.zero,
                                          topRight: i == controller.selectedCountry.length - 1 ? const Radius.circular(10) : Radius.zero,
                                          bottomRight: i == controller.selectedCountry.length - 1 ? const Radius.circular(10) : Radius.zero,
                                        ),
                                        color: selectedIndex == i?AppColors.primary:AppColors.shadow,
                                        border: Border.all(
                                            color: AppColors.subtitle.withOpacity(0.2))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(controller.selectedCountry[i],
                                            style: selectedIndex == i?button:subtitle
                                        ),
                                        selectedIndex == i?const Icon(Icons.check, color: AppColors.white, size: 15,):const SizedBox(),
                                      ],
                                    ),
                                  ),

                                )
                            ),
                        ]
                    ),
                  ),
                ).paddingOnly(top: 10,),
                controller.selectedCountry.length < 3
                ?GestureDetector(
                    onTap: () {
                      context.pushNamed(GoPath.searchCountry);
                    },
                    child: const Icon(
                      Icons.add_circle_sharp,
                      size: 18,
                      color: AppColors.primary,
                    ).paddingOnly(left: 8, top: 10))
                :const SizedBox()

              ],
            ),
            Divider(color: AppColors.subtitle.withOpacity(0.3),thickness: 1,height: 1,).paddingSymmetric(vertical: 10, horizontal: 20),
            const UniversitiesList()
          ]
        ],
      ),
    );
  }
}
