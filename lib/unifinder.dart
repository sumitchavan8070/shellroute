import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Components/Unifinder/recent_search.dart';
import 'package:testinggetx/Components/Unifinder/explore.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/text_form_validator.dart';

import 'Components/Unifinder/trending_serach.dart';
import 'constants/app_colors.dart';
import 'constants/text_styles.dart';

class UniFinder extends StatefulWidget {
  const UniFinder({super.key});

  @override
  State<UniFinder> createState() => _UniFinderState();
}

class _UniFinderState extends State<UniFinder> {
  FocusNode myfocus = FocusNode();
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        searchcontroller.clear();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          leadingWidth: 40,
          leading: InkWell(
              onTap: () {
                // context.pop();
              },
              child: SvgPicture.asset("assets/images/searchblue.svg").paddingOnly(left: 18))  ,
          title: TextFormField(
            controller: searchcontroller,
            inputFormatters: [AlphanumericFormatter()],
            keyboardType: TextInputType.text,
            cursorColor: AppColors.subtitle,
            style: const TextStyle(
                color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w400),
            decoration: InputDecoration(
                labelText: "Find Universities, courses, Exams, and more..",
                labelStyle: eventSubtitle,
                alignLabelWithHint: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none
                ),
                floatingLabelStyle: const TextStyle(
                    color: Colors.white
                ),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none
                )
            ),
            focusNode: myfocus,
            onFieldSubmitted: (value) {
              if(value.isEmpty == true){
                return;
              }
              else{
                controller.addsearch(value);
              }
              if (kDebugMode) {
                print(controller.recentsarch);
              }
            },
          ).paddingOnly(bottom: 15),
          actions: [
            InkWell(
                onTap: () {
                  searchcontroller.clear();
                  myfocus.unfocus();
                  // context.pop();
                },
                child: SvgPicture.asset("assets/images/blackcross.svg").paddingOnly(right: 10))
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Explore(),
                RecentSearch(),
                TrendingSearches()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
