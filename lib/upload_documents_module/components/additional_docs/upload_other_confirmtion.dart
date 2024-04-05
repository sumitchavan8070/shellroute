import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Components/snackbar.dart';

class UploadOtherConfirmation extends StatefulWidget {
  const UploadOtherConfirmation({
    super.key,
    required this.title,
    required this.title2,
    this.mapName,

  });

  final List<PlatformFile>? mapName;
  final String? title;
  final String? title2;

  @override
  State<UploadOtherConfirmation> createState() => _UploadOtherConfirmationState();
}

GetXMainController controller = Get.find<GetXMainController>();

class _UploadOtherConfirmationState extends State<UploadOtherConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        elevation: 3,
        title: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                'assets/images/cross.svg',
                fit: BoxFit.fill,
              ),
            ).onTap(() {
              Navigator.pop(context);
            }),
            const WidthBox(8),
            const Text(
              'ADD Document',
              style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                const Text(
                  'Are you sure you want to upload and\nsend this document for review?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontFamily: 'Heebo',
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
                const HeightBox(35),
                Container(
                  height: 59,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: ShapeDecoration(
                    color: AppColors.secondaryBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.title}',
                        style: const TextStyle(
                          color: Color(0xFF24292D),
                          fontSize: 16,
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                      ),
                      Text(
                        '${widget.title2} ',
                        style: const TextStyle(
                          color: Color(0xFFB0B2B5),
                          fontSize: 14,
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w400,
                          height: 1.14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: Obx(
                    () => controller.isLoading.value == false
                        ? ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              elevation: const MaterialStatePropertyAll(0),
                              backgroundColor: const MaterialStatePropertyAll(
                                  AppColors.primary),
                            ),
                            onPressed: () {
                              PlatformFile data = PlatformFile(
                                    name: widget.title.toString(),
                                    size: controller.localFile[0].size,
                                    path: controller.localFile[0].name
                                );
                                widget.mapName?.add(data);
                                snackbar(context,'Perfect! Your ${widget.title} is Uploaded');
                                if (kDebugMode) {
                                  print(widget.mapName.toString());
                                }
                                context.go(GoPath.tabBarDocs);

                                controller.localFile[0] = PlatformFile( name: widget.title.toString(), size: 00, path: null);
                                controller.isSelected.value = false;
                                if (kDebugMode) {
                                  print(widget.mapName.toString());
                                }

                            },
                            child: const Text(
                              'UPLOAD & SEND FOR REVIEW',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontFamily: 'Heebo',
                                fontWeight: FontWeight.w500,
                                height: 1.25,
                              ),
                            ))
                        : Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              color: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                backgroundColor: AppColors.white,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ).pOnly(bottom: 40, left: 20, right: 20)
        ],
      ),
    );
  }
}