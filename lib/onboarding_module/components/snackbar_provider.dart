import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';

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
                style: const TextStyle(color: AppColors.title),
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
          bottom: MediaQuery.of(context).size.height * 0.82,
          top: 20,
          left: 20,
          right: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          width: 1.0,
          strokeAlign: BorderSide.strokeAlignCenter,
          color: AppColors.notifyBorder,
        ),
      ),
    ),
  );
}
