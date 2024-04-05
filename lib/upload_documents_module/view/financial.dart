import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/getx_main_controller.dart';
import '../../constants/app_colors.dart';
import '../../routes/go_path.dart';
import '../components/custom_widget/custom_expnsion_tile.dart';

class Financial extends StatefulWidget {
  const Financial({super.key});

  @override
  State<Financial> createState() => _FinancialState();
}

class _FinancialState extends State<Financial> {
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
                          CustomTile(list: controller.financial, route: GoPath.uploadPageFirstPart,)
                        ]
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