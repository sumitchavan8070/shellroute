import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';


GetXMainController controller = Get.find<GetXMainController>();

Widget bodyPart({
  required BuildContext context,
  required String? title,
  required bool? isLast,
  required void Function()? onTap,
  required Color?color
}) {
  return Container(
    width: double.infinity,
    decoration: isLast!
        ? const ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          )
        : const ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
    child: Column(
      children: [
        Container(
          margin: isLast
              ? const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15)
              : const EdgeInsets.only(left: 10, right: 10, top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: color == AppColors.secondaryBg?Colors.transparent:AppColors.subtitle.withOpacity(0.3))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title ?? 'didn t get title!',
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Heebo'),
              ),
              GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset('assets/images/upload.svg')),
            ],
          ),
        ),
      ],
    ),
  );
}



Widget bodyAfterUpload({
  Widget? widget,
  required String? title,
  String? type,
  required BuildContext context,
  required bool? isLast,
}) {
  return Container(
    width: double.infinity,
    decoration: isLast!
        ? const ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          )
        : const ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
    child: Column(
      children: [
        Container(
          margin: isLast
              ? const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15)
              : const EdgeInsets.only(left: 10, right: 10, top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: double.infinity,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.secondaryBg,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      height: 19.7,
                      width: 20,
                      child: SvgPicture.asset(
                        'assets/images/mark.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const WidthBox(10),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width * 0.58,
                      child: Text(
                        title ?? 'no title found',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              widget ?? const Text(''),
            ],
          ),
        ),
      ],
    ),
  );
}
