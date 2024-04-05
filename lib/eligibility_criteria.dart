import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'constants/app_colors.dart';
import 'constants/classes.dart';
import 'constants/text_styles.dart';

class EligibilityCriteria extends StatelessWidget {
  const EligibilityCriteria({super.key});

  @override
  Widget build(BuildContext context) {
    List list = [
      'Online Application','Application fee','Transcripts', 'Personal Statement', 'Academic Reference', 'English language requirement'
    ];
    List<Feature> explore = [
      Feature(name: "TOEFL", svg: "100"),
      Feature(name:"IELTS", svg: "7"),
      Feature(name:"PTE", svg: "66"),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        elevation: 3,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: const Text(
                'Here’s the eligibility criteria for this course',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Application pre-requisites", style: blackName,).paddingOnly(top: 25),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        const SizedBox(width:10,child: Divider(color: AppColors.subtitle,thickness: 1,height: 1,)),
                        Text('${list[index]}',
                          style: subtitle,
                        ).pOnly(left: 5),
                        // SizedBox(height: 10,),
                      ],
                    ),
                  );
                }
            ).paddingSymmetric(vertical: 15),
            Text("Test score requirements", style: blackName,).paddingOnly(top: 10),
            Text('Minimum English Score',style: subtitle, ).pOnly(left: 10, top: 10),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: explore.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        SizedBox(width: 80,child: Text(explore[index].name,style: bigSubtitle,).pOnly(left: 5)),
                        SizedBox(width: 50,child: Text(explore[index].svg,style: blackName,).pOnly(left: 5)),
                      ],
                    ),
                  );
                }
            ).paddingSymmetric(vertical: 10, horizontal: 5),
            RichText(
              text: TextSpan(
                text: "To know all the course specific additional requirement speak to our ",
                style: blackText,
                children: [
                  TextSpan(text: 'Expert Counsellor',
                      style: underlineLinkText
                  ),
                ]
              ),



        )


          ]
        )
        )
      ),
    );
  }

}
