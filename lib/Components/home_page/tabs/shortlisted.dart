import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/text_styles.dart';
import 'action_bottom_sheet.dart';

class Shortlisted extends StatefulWidget {
  const Shortlisted({super.key});

  @override
  State<Shortlisted> createState() => _ShortlistedState();
}

class _ShortlistedState extends State<Shortlisted> {

  double visible = 0.0; // Initial position above the screen

  @override
  void initState() {
    super.initState();
    // Add a delay before animating the logo
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        visible = 1.0; // Final position at the center of the screen
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    GetXMainController controller = Get.put(GetXMainController());
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      opacity: visible,
      child: Obx(
        () => Container(
          // height: MediaQuery.of(context).size.width * 0.485 * controller.shorlist.length,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: Colors.white
          ),
          child: controller.shortlist.isEmpty == true
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/shortlisted.svg", height: 40,).paddingOnly(top: 20),
              const SizedBox(height: 4,),
              Text("Short but sure",
                  style: eventTitle
              ).pOnly(bottom: 20),
            ],
          )
          : Container(
            color: AppColors.subtitle.withOpacity(0.2),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/sbyyou.svg"),
                          const SizedBox(width: 5,),
                          SizedBox(
                            height: 18,
                            child: Text("Shortlisted by you", style: eventSubtitle,),
                          ),
                        ],
                      ),
                      const Text("View All Applications",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.tabBar,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.22,
                        ),
                      ),
                    ],
                  ).paddingOnly(top: 10, left: 15, right: 10,bottom: 5),
                ),
                Divider(color: AppColors.subtitle.withOpacity(0.2),thickness: 1,height: 1,),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.shortlist.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      // margin: const EdgeInsets.only(bottom: 8),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.asset("assets/images/university.png", fit: BoxFit.fill,)
                                        ),
                                      ),
                                      const SizedBox(width: 15,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.shortlist[index].name,
                                            style: smallTitle,
                                          ),
                                          Text(controller.shortlist[index].subject, style: subtitle,)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Transform.rotate(
                                    angle: 4.7,
                                    child: InkWell(
                                      onTap: () {
                                        actionBottomSheet(context: context, title: "Action", index: index);
                                      },
                                      child: SvgPicture.asset(
                                        "assets/images/dotmenu.svg",
                                      )
                                    )
                                  ),
                                ],
                              ).paddingSymmetric(vertical: 5, horizontal: 15),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.38,
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: AppColors.primary,
                                            width: 1.2
                                        ),
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("assets/images/apply.svg"),
                                          const SizedBox(width: 5,),
                                          Text("Apply Now",
                                              style: linkText
                                          ),
                                        ],
                                      ),

                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.38,
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: AppColors.black,
                                            width: 1.2
                                        ),
                                        // color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("assets/images/eligibility.svg"),
                                          const SizedBox(width: 5,),
                                          const Text("Check Eligibility",
                                              style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              )
                                          ),
                                        ],
                                      ),

                                    ),
                                  ),
                                ],
                              ).paddingOnly(bottom: 10)
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(color: Colors.transparent, height: 6,);
                  },
                ),

              ],
            ),
          ),

        ),
      ),
    );
  }
}




// Column(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Short but sure",
//                 style: smalltitle
//             ),
//             const SizedBox(height: 4,),
//             RichText(text: TextSpan(
//                 text: "Add universities that you are sure\nto apply to from your watchlist or\ntry our ",
//                 style: subtitle,
//                 children: [
//                   TextSpan(text: 'College finder',
//                       style: ornagesubtitile
//                   ),
//                 ]
//             ),
//             ),
//           ],
//         ),
//         SvgPicture.asset("assets/images/shortlisted.svg")
//       ],
//     ).pOnly(top: 15),
//     Container(
//       height: 30,width: MediaQuery.of(context).size.width,
//       color: AppColors.appBar.withOpacity(0.7),
//       child: InkWell(
//         onTap: () {
//           context.pushNamed("/application");
//         },
//         child: Center(
//           child: Text("+ Add Application",
//             style: underlinelinktext,
//           ),
//         ),
//       ),
//     ),
//
//   ],
// )