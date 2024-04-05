import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/getx_main_controller.dart';
import '../../constants/app_colors.dart';
import '../components/custom_widget/custom_expnsion_tile.dart';

class ApplicationDocs extends StatefulWidget {
  const ApplicationDocs({super.key});

  @override
  State<ApplicationDocs> createState() => _MyAppState();
}

class _MyAppState extends State<ApplicationDocs> {
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      /// Expansion List for Getting to Know You Section
                        CustomExpansionTile(title: "Getting to Know you", list: controller.gettingToKnowYou, route: '',)
                    ],
                  ),
                ).paddingOnly(bottom: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
