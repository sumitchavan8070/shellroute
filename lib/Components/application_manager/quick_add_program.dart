import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/constants/text_styles.dart';
import 'package:testinggetx/upload_documents_module/components/additional_docs/upload_button.dart';

class QuickAddProgram extends StatefulWidget {
  const QuickAddProgram({super.key});

  @override
  State<QuickAddProgram> createState() => _QuickAddProgramState();
}

class _QuickAddProgramState extends State<QuickAddProgram> {

  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Quick Add Program",style: blackName,),
            const UploadButton(color: AppColors.primary, title: "Search Program", height: 35 , width: 150,)
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.shadow),
            borderRadius: BorderRadius.circular(5)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Text("We only show eligible courses for this student for the selected intake, year and university. To understand why certain courses are not eligible for this student, please go to Search Program.",
              style: eventSubtitle,
              maxLines: null,
              ).paddingOnly(bottom: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.shadow),
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select Year", style: subtitle,),
                    const Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.subtitle,size: 25,)
                  ],
                ),
              ).paddingOnly(bottom: 15),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.shadow),
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select Intake", style: subtitle,),
                    const Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.subtitle,size: 25,)
                  ],
                ),
              ).paddingOnly(bottom: 15),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.shadow),
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select University", style: subtitle,),
                    const Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.subtitle,size: 25,)
                  ],
                ),
              ).paddingOnly(bottom: 15),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.shadow),
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select Program", style: subtitle,),
    const Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.subtitle,size: 25,)
                  ],
                ),
              ).paddingOnly(bottom: 30),
              UploadButton(
                color: AppColors.primary.withOpacity(0.7),
                title: "ADD",
                height: 40,
                width: 105,
                onPressed: () {
                  setState(() {
                    show = !show;
                  });
                },
              )
            ],
          ),
        ).paddingSymmetric(vertical: 10),
        Text("Selected Programs", style: blackName,).paddingOnly(top: 25),
        Visibility(
          visible: !show,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.shadow),
                borderRadius: BorderRadius.circular(5)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text("Pre-Master’s for Business, Hospitality, Tourism and Social Science (3 Terms)",
                        style: eventTitle,
                        maxLines: null,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        child: SvgPicture.asset("assets/images/delete.svg"))
                  ],
                ),
                Container(
                  decoration: ShapeDecoration(
                    color: AppColors.appBar,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  child: const Text("55 in Webometrics National Raking",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ).paddingOnly(top: 5, bottom: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("University:", style: eventTitle,).paddingOnly(right: 10),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.56,
                        child: Text("(KAPLAN) University of Brighton", style: eventSubtitle,))
                  ],
                ).paddingOnly(bottom: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Country:", style: eventTitle,).paddingOnly(right: 10),
                    Text("United Kingdom", style: eventSubtitle,)
                  ],
                ).paddingOnly(bottom: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Selected Intake:", style: eventTitle,).paddingOnly(right: 10),
                    Text("Jun-2024", style: eventSubtitle,)
                  ],
                ).paddingOnly(bottom: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("University:", style: eventTitle,).paddingOnly(right: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF3DC31C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(53),
                            ),
                          ),
                          child: Text("Jun", style: button,),
                        ).paddingOnly(right: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF3DC31C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(53),
                            ),
                          ),
                          child: Text("Nov", style: button,),
                        ).paddingOnly(right: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF3DC31C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(53),
                            ),
                          ),
                          child: Text("Dec", style: button,),
                        ).paddingOnly(right: 5),
                      ],
                    )
                  ],
                ).paddingOnly(bottom: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Tuition Fee:", style: eventTitle,).paddingOnly(right: 10),
                    Text("\$3,300", style: eventSubtitle,)
                  ],
                ).paddingOnly(bottom: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Application Fee:", style: eventTitle,).paddingOnly(right: 10),
                    const Text("Rs. 1000", style: TextStyle(color: AppColors.green, fontSize: 14, fontWeight: FontWeight.w600),)
                  ],
                ).paddingOnly(bottom: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Duration:", style: eventTitle,).paddingOnly(right: 10),
                    Text("3 Months(s)", style: eventSubtitle,)
                  ],
                ).paddingOnly(bottom: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Select Priority:", style: eventTitle,).paddingOnly(right: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Color(0x3F747579)),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("None", style: eventTitle,).paddingOnly(right: 30),
                          const Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.subtitle,size: 25,)
                        ],
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 15),
              ],
            ),
          ).paddingSymmetric(vertical: 10),
        ),
        Visibility(
          visible: !show,
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              decoration: ShapeDecoration(
                color: AppColors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              child: const Text(
                'Pay Application Fee',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: show,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.shadow),
                borderRadius: BorderRadius.circular(5)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Text("Search for courses relevant to the student's profile from more than 80,000+ courses across 700+ Universities, using our dynamic 'Search Program' functionality.After searching the relevant courses you can associate courses to the student's profile by clicking on 'Associate Shortlisted Courses'.",
                style: eventSubtitle,
                  maxLines: null,
                ).paddingOnly(bottom: 10),
              ],
            ),
          ).paddingSymmetric(vertical: 10),
        ),
      ],
    );
  }
}
