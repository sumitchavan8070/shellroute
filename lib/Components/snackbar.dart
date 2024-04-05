import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testinggetx/constants/app_colors.dart';
import '../constants/text_styles.dart';

snackbar(BuildContext context, String title) {
  final scaffold = ScaffoldMessenger.of(context);

  scaffold.showSnackBar(
    SnackBar(
      content: SizedBox(
        child: Row(
          children: [
            SizedBox(
              height: 22.65,
              width: 23,
              child: SvgPicture.asset('assets/images/mark.svg'),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: blackText,
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: AppColors.notify,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.7,
          top: 20,
          left: 20,
          right: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          width: 1.0,
          strokeAlign: BorderSide.strokeAlignCenter,
          color: AppColors.green,
        ),
      ),
    ),
  );
}
