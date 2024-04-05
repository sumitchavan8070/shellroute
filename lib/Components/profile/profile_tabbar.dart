import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Components/profile/personal_information.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/text_styles.dart';
import '../../constants/app_colors.dart';

class ProfileTabbar extends StatefulWidget {
  const ProfileTabbar({super.key});

  @override
  State<ProfileTabbar> createState() => _ProfileTabbarState();
}

class _ProfileTabbarState extends State<ProfileTabbar> {
  int selectedIndex = 0;

  List<Widget> childWidgets = [
    const PersonalInformation(),
    const PersonalInformation(),
    const PersonalInformation(),
    const PersonalInformation(),
    const PersonalInformation(),
    const PersonalInformation(),
    const PersonalInformation(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return Column(
      children: [
        DefaultTabController(
          length: controller.profileTabbar.length,
          child: SizedBox(
            height: 40,
            child: TabBar(
                dividerColor: AppColors.black,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                indicatorColor: Colors.transparent,
                tabs: [
                  for (int i = 0; i < controller.profileTabbar.length; i++)
                    Tab(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = i;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            decoration: ShapeDecoration(
                              color: selectedIndex== i?AppColors.tabBar:AppColors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: selectedIndex== i?Colors.transparent:AppColors.tabBar),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center ,
                              children: [
                                SvgPicture.asset(controller.profileTabbar[i].svg),
                                const SizedBox(width: 5,),
                                Text(controller.profileTabbar[i].name,
                                  style: selectedIndex==i?button:eventTitle,
                                ),
                              ],
                            ),
                          ).paddingOnly(right: 25),
                        )
                    ),
                ]
            ),
          ),
        ).paddingOnly(top: 10,bottom: 15),
        childWidgets.elementAt(selectedIndex),

      ],
    );

  }
}
