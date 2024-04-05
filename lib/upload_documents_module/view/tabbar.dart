import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Controller/tab_controller.dart';
import 'package:testinggetx/upload_documents_module/view/additional_docs.dart';
import 'package:testinggetx/upload_documents_module/view/all_docs.dart';
import 'package:testinggetx/upload_documents_module/view/financial.dart';
import 'package:testinggetx/upload_documents_module/view/visa.dart';

import '../../Components/custom_app_bar.dart';
import '../../constants/app_colors.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXTabController());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                // color: AppColors.white
              ),
              child: TabBar(
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 6),
                  controller: controller.tabcontroller,
                  isScrollable: true,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:AppColors.tabBar
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8, ),
                  labelColor: Colors.white, // Tab bar selected Label Color..
                  unselectedLabelColor: AppColors.black,
                  indicatorColor: Colors.transparent,
                  // indicatorSize: TabBarIndicatorSize.tab,
                  tabs:  [
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.tabBar)
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("All"),
                        ),

                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.tabBar)
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Application"),
                        ),

                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.tabBar)
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Visa"),
                        ),

                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.tabBar)
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Financial"),
                        ),

                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.tabBar)
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Additional"),
                        ),

                      ),
                    ),
                  ]
              ),
            ).paddingSymmetric(vertical: 35),
            Expanded(
                child: TabBarView(
                  controller: controller.tabcontroller,
                  children: const [
                    AllDocs(),
                    AllDocs(),
                    Visa(),
                    Financial(),
                    AdditionalDocs(),
                  ]
                )
            )
          ],
        )
      ),
    );
  }
}
