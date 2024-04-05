import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Components/Explore/tab_text.dart';
import 'package:testinggetx/Components/Explore/scroll_card.dart';
import 'package:testinggetx/constants/text_styles.dart';
import 'Components/custom_app_bar.dart';
import 'Components/Explore/scroll_search_tab.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}
class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Explore: Best Colleges & Universities to Study Abroad",
                style: blackName,
                textAlign: TextAlign.start,
                maxLines: 3,
              ).paddingOnly(left: 20, right: 20, top: 25),
              Text(
                "All you need to know about university fees, courses, deadlines, scholarships and more.",
                style: subtitle,
                textAlign: TextAlign.start,
                maxLines: 3,
              ).paddingSymmetric(vertical: 12, horizontal: 20),
              const ScrollSearchTab().paddingOnly(bottom: 20),
              const ScrollCard().paddingSymmetric(vertical: 0, horizontal: 20),
              const TabBarDynamicListing(),


            ],
          ),
        ),
      ),
    );
  }
}
