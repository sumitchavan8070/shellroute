import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/text_styles.dart';

import '../../constants/app_colors.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final controller = Get.put(GetXMainController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Explore Universities in top destinations", style: eventTitle,).paddingOnly(bottom: 10),
        Wrap(
          spacing: 10.0,runSpacing: 10,
          direction: Axis.horizontal,
          children: [
            for (int i = 0; i < controller.explore.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                    if (kDebugMode) {
                      print(selectedIndex);
                    }
                  });
                },
                child: IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    // height: 35,
                    // width: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: selectedIndex == i? AppColors.primary:AppColors.subtitle.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 18,width: 30,
                            child: SvgPicture.asset(
                              controller.explore[i].svg,
                              fit: BoxFit.fill,
                            )
                          ),
                          const SizedBox(width: 5,),
                          Text(controller.explore[i].name,style: selectedIndex == i?linkText:eventTitle,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        )
      ],
    );

  }

  int selectedIndex = -1;
}
