import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/constants/text_styles.dart';

class UnpaidApplications extends StatelessWidget {
  const UnpaidApplications({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Unpaid Applications",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ).paddingOnly(top: 30, bottom: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.unpaidApplication.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/mark.svg", height: 14,)
                        .paddingOnly(right: 8,top: 2),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                        controller.unpaidApplication[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.subtitle
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 10, left: 10);
              },
            ).paddingOnly(bottom: 15),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.unpaidApplicationList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: AppColors.shadow),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Program Name:",
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ).paddingOnly(right: 10),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: Text(
                                controller.unpaidApplicationList[index].name,
                                style: const TextStyle(
                                    color: AppColors.subtitle,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ))
                        ],
                      ).paddingOnly(bottom: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "University:",
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ).paddingOnly(right: 10),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.56,
                              child: Text(
                                controller.unpaidApplicationList[index].svg,
                                style: const TextStyle(
                                    color: AppColors.subtitle,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ))
                        ],
                      ).paddingOnly(bottom: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Intake:",
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ).paddingOnly(right: 10),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.56,
                              child: const Text(
                                "Jun-2024",
                                style: TextStyle(
                                    color: AppColors.subtitle,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ))
                        ],
                      ).paddingOnly(bottom: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Application Fee:",
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ).paddingOnly(right: 10),
                              const Text(
                                "Rs. 1000",
                                style: TextStyle(
                                    color: AppColors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          SvgPicture.asset("assets/images/delete.svg", height: 25,)
                        ],
                      ),
                    ],
                  ),
                );
              },
            ).paddingOnly(bottom: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Total Fees:  ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Rs.2000',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ).paddingOnly(bottom:10),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: ShapeDecoration(
                  color: AppColors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                child: Text('Pay Now', style: button ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
