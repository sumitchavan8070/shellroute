import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/app_colors.dart';


class ViewLorDetails extends StatefulWidget {
  const ViewLorDetails({super.key,
    required this.title
  });
  final String? title;

  @override
  State<ViewLorDetails> createState() => _ViewLorDetailsState();
}
GetXMainController controller = Get.find<GetXMainController>();

class _ViewLorDetailsState extends State<ViewLorDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.secondaryBg,
          elevation: 3,
          title: Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  'assets/images/cross.svg',
                  fit: BoxFit.fill,
                ),
              ).onTap(() {
                Navigator.pop(context);
              }),
              const WidthBox(8),
              const Text(
                'LOR Details',
                style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            TextFormField(
              initialValue:
              widget.title == "LOR1"
                  ? controller.lorDetails1['recommendersName']
                  : controller.lorDetails2['recommendersName'],
              readOnly: true,
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              decoration: const InputDecoration(
                labelText: 'Recommender’s Name',
              ),
            ),
            const HeightBox(25),
            TextFormField(
              initialValue:               widget.title == "LOR1"
                  ? controller.lorDetails1['recommendersDesignation']
                  : controller.lorDetails2['recommendersDesignation'],
              readOnly: true,
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              decoration: const InputDecoration(
                labelText: 'Recommender’s Designation',
              ),
            ),
            const HeightBox(25),
            TextFormField(
              initialValue:               widget.title == "LOR1"

                  ? controller.lorDetails1['officialEmailId']
                  : controller.lorDetails2['officialEmailId'],
              readOnly: true,
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              decoration: const InputDecoration(
                labelText: 'Official Email Id',
              ),
            ),
            const HeightBox(25),
            TextFormField(
              initialValue:               widget.title == "LOR1"

                  ? controller.lorDetails1['relationWithStudent']
                  : controller.lorDetails2['relationWithStudent'],
              readOnly: true,
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              decoration: const InputDecoration(
                labelText: 'Relation with the Student',
              ),
            ),
            const HeightBox(25),
          ],
        ).pOnly(left: 20, right: 20, top: 40),
      ),
    );
  }
}
