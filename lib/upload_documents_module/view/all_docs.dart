// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testinggetx/routes/go_path.dart';
import '../../Controller/getx_main_controller.dart';
import '../../constants/app_colors.dart';
import '../components/custom_widget/custom_expnsion_tile.dart';


class AllDocs extends StatefulWidget {
  const AllDocs({super.key});

  @override
  State<AllDocs> createState() => _MyAppState();
}

// GetXMainController controller = Get.find<GetXMainController>();

class _MyAppState extends State<AllDocs> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width ,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      /// ///////   CustomExpansionTile for 'getting to know you'  ////////////
                      CustomExpansionTile(
                        title: "Getting to know You",
                        list: controller.gettingToKnowYou,
                        route: GoPath.uploadPageFirstPart,
                      ),
                      /// ///////   CustomExpansionTile for 'Degree and transcripts'  ////////////
                      CustomExpansionTile(
                        title: "Degrees & Transcripts",
                        list: controller.degree,
                        route: GoPath.uploadMultiple,
                      ),
                      /// ///////   CustomExpansionTile for 'high school docs'  ////////////
                      CustomExpansionTile(
                        title: "High School Marksheet",
                        list: controller.highSchoolDocs,
                        route: GoPath.uploadPageFirstPart,
                      ),
                      /// ///////   CustomExpansionTile for 'Aptitude Test Marksheet'  ////////////
                      CustomExpansionTile(
                        title: "Aptitude Test Marksheet",
                        list: controller.aptitude,
                        route: GoPath.uploadPageFirstPart,
                      ),
                      /// ///////   CustomExpansionTile for 'English Proficiency Test Scores'  ////////////
                      CustomExpansionTile(
                        title: "English Proficiency Test Scores",
                        list: controller.englishProficiency,
                        route: GoPath.uploadPageFirstPart,
                      ),
                      /// ///////   CustomExpansionTile for 'Professional Experience'  ////////////
                      CustomExpansionTile(
                        title: "Professional Experience",
                        list: controller.professionalExperience,
                        route: GoPath.uploadPageFirstPart,
                      ),
                      /// ///////   CustomExpansionTile for 'Personal Information'  ////////////
                      CustomExpansionTile(
                        title: "Personal Information",
                        list: controller.personalInformation,
                        route: GoPath.uploadPageFirstPart,
                      ),
                      /// ///////   CustomExpansionTile for 'Others'  ////////////
                      CustomExpansionTile(
                        title: "Others",
                        list: controller.others,
                        route: GoPath.uploadPageFirstPart,
                      ),
                      /// ///////   CustomExpansionTile for 'Visa'  ////////////
                      CustomExpansionTile(
                        title: "Visa",
                        list: controller.visa,
                        route: GoPath.uploadPageFirstPart,
                      ),
                      /// ///////   CustomExpansionTile for 'Financial'  ////////////
                      CustomExpansionTile(
                        title: "Financial",
                        list: controller.financial,
                        route: GoPath.uploadPageFirstPart,
                      ),


                    ],
                  )

                ).paddingOnly(bottom: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
