import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Components/home_page/upcoming_events.dart';

import 'Components/custom_app_bar.dart';
import 'Components/home_page/finder.dart';
import 'Components/home_page/profile_card.dart';
import 'Components/home_page/tab_card.dart';
import 'Controller/getx_main_controller.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
final controller = Get.put(GetXMainController());

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const ProfileCard().paddingOnly(top: 25, left: 15, right: 15),
            const Finder(),
            const TabCard(),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(8),
            //   child: SvgPicture.asset(
            //     "assets/images/banner.svg",
            //     fit: BoxFit.fill,
            //     width: MediaQuery.of(context).size.width * 0.98,),
            // ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/banner.png",
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 0.96,),
            ).paddingSymmetric(vertical: 10),
            // ScrollTab(),
            //ScrollCard(),
            const Events(),
            // SearchBarDemo()
          ],
        ),
      ),
    );
  }
}
