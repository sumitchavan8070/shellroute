import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/routes/go_path.dart';
import '../../../constants/text_styles.dart';

actionBottomSheet(
    {required BuildContext context,
    required String title,
    required int index,

    void Function()? onTap})
{
  final controller = Get.put(GetXMainController());
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    backgroundColor: Colors.white,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.36,
        child: Column(
          children: [
            Container(
              height: 54,
              decoration: const ShapeDecoration(
                color: Color(0xFFF5F7F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 7,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                    padding:
                    const EdgeInsets.only(left: 25, right: 10, top: 5, bottom: 5),
                    child: InkWell(
                      onTap: () {
                        // context.pop();
                      },
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          'assets/images/blackcross.svg',
                          height: 20,
                          width: 20,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )),
                Text('Action', style: blackName)
              ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(GoPath.editapplication,
                          pathParameters: {
                            'title': "Edit Application",
                            'name' : "Oxford University",
                            'course' : "B.Ed"
                      });
                    },
                    child: Row(
                      children: [
                        SizedBox(
                            width: 18,
                            child: SvgPicture.asset(
                              "assets/images/editapplication.svg",
                              fit: BoxFit.fill,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                            width: 150,
                            child: Text(
                              "Edit Application",
                              textAlign: TextAlign.left,
                              style: subtitle,
                            ))
                      ],
                    ).paddingSymmetric(vertical: 5),
                  ),
                  Divider(
                    color: AppColors.subtitle.withOpacity(0.4),
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.shortlist.removeAt(index);
                      Navigator.pop(context);
                      // context.pushNamed(GoPath.homePage);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                            width: 18,
                            child: SvgPicture.asset(
                                "assets/images/blackdelete.svg",
                                fit: BoxFit.fill)),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                            width: 150,
                            child: Text(
                              "Remove Application",
                              textAlign: TextAlign.left,
                              style: subtitle,
                            ))
                      ],
                    ).paddingSymmetric(vertical: 5),
                  ),
                  Divider(
                    color: AppColors.subtitle.withOpacity(0.4),
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 18,
                          child: SvgPicture.asset(
                            "assets/images/raiseconcern.svg",
                            fit: BoxFit.fill,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                          width: 150,
                          child: Text("Raise Concern",
                            style: linkText,
                            textAlign: TextAlign.left,
                          ))
                    ],
                  ).paddingSymmetric(vertical: 5),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
