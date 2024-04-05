import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Components/home_page/tabs/applied.dart';
import 'package:testinggetx/Components/home_page/tabs/results.dart';
import 'package:testinggetx/Components/home_page/tabs/shortlisted.dart';
import 'package:testinggetx/Components/home_page/tabs/watchlisted.dart';
import '../../Controller/tab_controller.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../../routes/go_path.dart';

class TabCard extends StatefulWidget {
  const TabCard({super.key});

  @override
  State<TabCard> createState() => _TabCardState();
}

class _TabCardState extends State<TabCard> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  List<Widget> childWidgets = [
    const Watchlisted(),
    const Shortlisted(),
    const Applied(),
    const Results()
    // AnimatedContent(isVisible: selectedIndex == 0, child: child)

  ];
  void init(){
    super.initState();
    selectedIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXTabController());
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.subtitle.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.95,
            child: TabBar(
                dividerColor: AppColors.black,
                onTap: (value) {
                  setState(() => selectedIndex = value);
                  // _pageController.animateToPage(value, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                },
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
                controller: controller.tabcardcontroller,
                isScrollable: false,
                unselectedLabelStyle: const TextStyle(
                  color: AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                labelStyle: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                // indicator: BoxDecoration(
                //   color: AppColors.appBar,
                //   borderRadius:BorderRadius.circular(5)
                // ),
                labelColor: AppColors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: AppColors.black,
                labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                indicatorColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                      color: selectedIndex == 0?AppColors.appBar:Colors.white,
                        borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(8)),
                        border: Border.all(
                            color: AppColors.subtitle.withOpacity(0.2))),
                      duration: const Duration(milliseconds: 600),
                      child: const Center(
                        child: Text("Watchlist"),
                      ),
                  )),
                  Tab(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        decoration: BoxDecoration(
                        color: selectedIndex == 1?AppColors.appBar:Colors.white,
                        border: Border.all(
                            color: AppColors.subtitle.withOpacity(0.2))),
                    child: const Center(
                      child: Text("Shortlisted"),
                    ),
                  )),
                  Tab(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                    decoration: BoxDecoration(
                        color: selectedIndex == 2?AppColors.appBar:Colors.white,
                        border: Border.all(
                            color: AppColors.subtitle.withOpacity(0.2))),
                    child: const Center(
                      child: Text("Applied"),
                    ),
                  )),
                  Tab(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.only(topRight: Radius.circular(8)),
                        color: selectedIndex == 3?AppColors.appBar:Colors.white,
                        border: Border.all(
                            color: AppColors.subtitle.withOpacity(0.2))),
                    child: const Center(
                      child: Text("Result"),
                    ),
                  )),
                  // Tab(text: "",),
                  // Tab(text: "Applied",),
                  // Tab(text: "Results",),
                ]),
          ),
          // PageV
          childWidgets.elementAt(selectedIndex),
          Container(
            height: 35,width: MediaQuery.of(context).size.width,
            color: AppColors.appBar.withOpacity(0.7),
            child: InkWell(
              onTap: () {
                context.pushNamed(GoPath.application, pathParameters: {'title': "Add Application"});
              },
              child: Center(
                child: Text("+ Add Application",
                  style: underlineLinkText,
                ),
              ),
            ),
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 15, vertical: 12);

  }
}
