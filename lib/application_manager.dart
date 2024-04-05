import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Components/application_manager/Applied.dart';
import 'package:testinggetx/Components/application_manager/Results.dart';
import 'package:testinggetx/Components/application_manager/Shortlisted.dart';
import 'package:testinggetx/Components/application_manager/quick_add_program.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/text_styles.dart';
import 'constants/app_colors.dart';

class ApplicationManager extends StatefulWidget {
  const ApplicationManager({super.key});

  @override
  State<ApplicationManager> createState() => _ApplicationManagerState();
}

class _ApplicationManagerState extends State<ApplicationManager> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Application Manger", style: blackName,).paddingOnly(top: 25, bottom: 5),
              IntrinsicWidth(child: Text("Add and track all your university applications right here!", style: subtitle,maxLines: 2,)),
              DefaultTabController(
                length: 4,
                child: Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                  ),
                  child: TabBar(
                      indicatorPadding: const EdgeInsets.symmetric(horizontal: 3),
                      isScrollable: true,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8, ),
                      indicatorColor: Colors.transparent,
                      // indicatorSize: TabBarIndicatorSize.tab,
                      tabs:  [
                        for (int i = 0; i < controller.applicationManager.length; i++)
                        Tab(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = i;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: selectedIndex == i?AppColors.primary:AppColors.subtitle.withOpacity(0.1),
                                  border: Border.all(color: selectedIndex == i?Colors.transparent:AppColors.shadow)
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  controller.applicationManager[i].toString(),
                                  style: selectedIndex == i?button:subtitle,
                                ),
                              ),

                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ).paddingOnly(top: 25, bottom: 15),
              Text("+ Add Application", style: underlineLinkText,).paddingOnly(bottom: 25),
              _pages.elementAt(selectedIndex)

            ],
          ),
        ),
      ),
    );
  }

  int selectedIndex = 0;
  final List _pages = const [
    QuickAddProgram(),
    // Watchlisted(),
    Shortlisted(),
    Applied(),
    Results()
  ];
}
