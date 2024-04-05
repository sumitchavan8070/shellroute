// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';

class ExploreDropDownButton extends StatelessWidget {
  ExploreDropDownButton({
    super.key,
    required this.title,
    this.onTap,
    this.color
  });
  String? title;
  VoidCallback? onTap;
  Color? color;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.subtitle.withOpacity(0.3))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title.toString(), style: eventSubtitle,).paddingOnly(right: 35),
            const Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.subtitle,)
          ],
        ),
      ).paddingOnly(right: 15),
    );
  }
}
