import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/routes/go_path.dart';
import '../../../Controller/getx_main_controller.dart';
import '../../../constants/app_colors.dart';
import '../../../upload_documents_module/components/custom_widget/custom_expnsion_tile.dart';
import '../../components/proceed_button.dart';

class DocumentHub extends StatefulWidget {
  const DocumentHub({super.key});

  @override
  State<DocumentHub> createState() => _MyAppState();
}
class _MyAppState extends State<DocumentHub> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width ,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // height: MediaQuery.of(context).size.height * .4,
                  child: Column(
                    children: [
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
                    ],
                  ),
                ).paddingOnly(bottom: 50),
                ProceedSkipButton(
                  onPressed: () {
                    context.pushNamed(GoPath.congratulationScreen);
                  },
                  onPressedSkip: () {
                    context.pushNamed(GoPath.congratulationScreen);
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
