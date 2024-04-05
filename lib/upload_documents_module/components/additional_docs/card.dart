import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/upload_documents_module/components/additional_docs/upload_button.dart';
import 'package:testinggetx/routes/go_path.dart';

import '../../../constants/app_colors.dart';

class UploadCard extends StatefulWidget {
  const UploadCard({super.key});

  @override
  State<UploadCard> createState() => _UploadCardState();
}

class _UploadCardState extends State<UploadCard> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.subtitle.withOpacity(0.6),
      strokeWidth: 1.8,
      borderType: BorderType.RRect,
      dashPattern: const [4,4],
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20,),
            SvgPicture.asset("assets/images/upload.svg", height: 30,),
            const SizedBox(height: 8,),
            const Text("Upload Additional Documents",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10,),
            const Text("Documents which don't come under Application,\nVisa & Financial Type",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.subtitle,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 25,),
            UploadButton(
              color: AppColors.subtitle,
              title: "Upload",
              height: 45 ,
              width: 180,
              onPressed: () {
                context.pushNamed(GoPath.docName);
              },
            ),
            const SizedBox(height: 20,),

          ],
        ),

      ),
    ).paddingOnly(top: 0, left: 5, right: 5, bottom: 10);
  }
}
