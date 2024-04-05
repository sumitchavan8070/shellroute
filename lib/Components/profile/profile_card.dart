import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testinggetx/constants/app_colors.dart';

class ProfileContainerCard extends StatelessWidget {
  const ProfileContainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          decoration: ShapeDecoration(
          color: AppColors.secondaryBg,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x3F747579)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: const Text(
                  'What Financial Support?',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF24292D),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ).paddingOnly(bottom: 20),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: ShapeDecoration(
                  color: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                child: const Text(
                  'Try Out Loan Finder',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          decoration: ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x23000000),
                blurRadius: 6,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: const Text(
                  'Shortlist Universities the smart way!',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF24292D),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ).paddingOnly(bottom: 20),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF3601E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                child: const Text(
                  'Try Out Loan Finder',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),

        ),
      ],
    ).paddingSymmetric(vertical: 25);
  }
}
