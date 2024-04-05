import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/constants/text_styles.dart';

import '../../Controller/getx_main_controller.dart';

class ScrollCard extends StatefulWidget {
  const ScrollCard({super.key});

  @override
  State<ScrollCard> createState() => _ScrollCardState();
}

class _ScrollCardState extends State<ScrollCard> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (_scrollOffset < _scrollController.position.maxScrollExtent) {
        _scrollOffset += 1.0; // Adjust the scroll speed as needed
        _scrollController.jumpTo(_scrollOffset);
      } else {
        _scrollOffset = 0;
        _scrollController.jumpTo(_scrollOffset);
      }
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xff03284A),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SvgPicture.asset("assets/images/diamond.svg").paddingOnly(top: 25),
          const Text(
            "Get step by step guidance to reach your Dream University.",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: 25, vertical: 12),
          const Text(
            "Get FREE Counselling",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xffFFA400)),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: controller.tablist.length * 20,
                itemBuilder: (BuildContext context, int index) {
                  final indexes = index % controller.tablist.length;
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.subtitle.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1))
                        ]
                        // color: Colors.red
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          controller.tablist[indexes].svg,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.tablist[indexes].name,
                              style: eventTitle,
                            ),
                            Text(
                              controller.tablist[indexes].subtitle.toString(),
                              style: subtitle,
                            ),
                          ],
                        ),
                        // SizedBox(height: 10,),
                      ],
                    ),
                  ).paddingSymmetric(
                    horizontal: 10,
                  );
                }),
          ).paddingOnly(bottom: 25, top: 15)
        ],
      ),
    ).paddingOnly(bottom: 15);
  }
}
