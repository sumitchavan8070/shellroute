import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:testinggetx/upload_documents_module/components/upload_concept.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Components/snackbar.dart';
import '../../../Controller/getx_main_controller.dart';
import '../../../constants/app_colors.dart';

class LORUploadPage extends StatefulWidget {
  const LORUploadPage({
    super.key,
    this.mapName,
    required this.index,
    this.title1,
    this.title2,
  });

  final RxList<PlatformFile>? mapName;
  final String? index;
  final String? title1;
  final String? title2;

  @override
  State<LORUploadPage> createState() => _LORUploadPageState();
}

GetXMainController controller = Get.find<GetXMainController>();

class _LORUploadPageState extends State<LORUploadPage> {
  String calculate(int sizeInBytes) {
    double sizeInMB = sizeInBytes / (1024 * 1024);
    return '${sizeInMB.toDoubleStringAsFixed()} MB';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.isSelected.value = false;
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.secondaryBg,
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
                controller.isSelected.value = false;
                context.findAncestorStateOfType<NavigatorState>()?.pop();
              }),
              const WidthBox(8),
              Text(
                'Upload ${widget.title1}',
                style: const  TextStyle(
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
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                SizedBox(
                  height: 26,
                  width: 36,
                  child: SvgPicture.asset(
                    'assets/images/upload.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                const HeightBox(10),
                const Text(
                  "Upload file from device",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black),
                ),
                const HeightBox(10),
                const Text(
                  "Supported formats: docx, doc",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subtitle),
                ),
                const HeightBox(10),
                const Text(
                  "Size Limit: 10MB",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subtitle),
                ),
                const HeightBox(30),

// after selecting file
                Obx(
                      () => controller.isSelected.value
                      ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 18.05,
                                    width: 15,
                                    child: SvgPicture.asset(
                                      'assets/images/file.svg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const WidthBox(10),
                                  SizedBox(
                                    height: 40,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.75,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.localFile[0].name,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: AppColors.black,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          'File Size:  ${calculate(controller.localFile[0].size)}',
                                          style: const TextStyle(
                                              color: AppColors.subtitle,
                                              fontSize: 14)
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // end of the selected file
                          SizedBox(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                height: 18,
                                width: 15,
                                child: SvgPicture.asset(
                                    'assets/images/fileremove.svg'),
                              ),
                            ),
                          ).onTap(
                                () {
                              // widget.mapName?[indexx] = PlatformFile(name: '', size: 0);
                              controller.isSelected.value = false;
                            },
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: AppColors.subtitle,
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                      ),
                      Container(
                        height: 44,
                        decoration: ShapeDecoration(
                          color: AppColors.secondaryBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.20,
                          right: MediaQuery.of(context).size.width * 0.20,
                          top: MediaQuery.of(context).size.height * 0.10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16.5,
                              child: SvgPicture.asset(
                                'assets/images/replace.svg',fit: BoxFit.fill,),
                            ),
                            const WidthBox(10),
                            const Text(
                              'Replace File',
                              style: TextStyle(
                                color: Color(0xFF24292D),
                                fontSize: 16,
                                fontFamily: 'Heebo',
                                fontWeight: FontWeight.w500,
                                height: 1.25,
                              ),
                            ),
                          ],
                        ).onTap(
                              () async {
                            controller.localFile[0] =
                            await pickFile(context: context, formatChange: true);
                            int? filesize = controller.localFile[0].size;
                            if ( filesize < (10 * 1024 * 1024)  && filesize != 0) {
                              controller.isSelected.value = true;
                            } else {
                              controller.isSelected.value = false;
                            }
                          },
                        ),
                      ),
                    ],
                  ).pOnly(left: 20, right: 20)
                      : Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width * 0.30),
                        height: 44,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: AppColors.secondaryBg,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 18,
                              child: SvgPicture.asset(
                                'assets/images/addfile.svg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            const WidthBox(5),
                            const Text(
                              "Select File",
                            )
                          ],
                        ),
                      ).onTap(
                            () async {
                          controller.localFile[0] =
                          await pickFile(context: context, formatChange: true);
                          if (kDebugMode) {
                            print(controller.localFile[0].toString());
                          }
                          int? filesize = controller.localFile[0].size;
                          if ( filesize < (10 * 1024 * 1024)  && filesize != 0) {
                            controller.isSelected.value = true;
                          } else {
                            controller.isSelected.value = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
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
                          if (controller.isSelected.value) {
                            if (controller.localFile[0].path != null) {
                              int? filesize = controller.localFile[0].size;
                              if (filesize < (10 * 1024 * 1024) &&
                                  filesize != 0) {
                                context.pushNamed(GoPath.lorConfirmation,
                                  pathParameters: {
                                    'title2': widget.title2.toString(),
                                    'title1': widget.title1.toString(),
                                    'index': widget.index.toString(),
                                  },
                                  extra: widget.mapName,
                                );
                                controller.isSelected.value = false;
                              } else {
                                snackbar(context,
                                    'fileSize should be less than 10MB!!');
                                controller.isSelected.value = false;
                              }
                            } else {
                              debugPrint('if2');

                              debugPrint('Please select a valid file');
                              // snackbar(
                              //     context, 'Please select a valid file');
                            }
                          }
                          else {
                            debugPrint('if1');
                              debugPrint('Please select a valid file');
                            // snackbar(context, 'Please select a valid file');
                          }
                        },
                        child: const Text(
                          "UPLOAD",
                          style: TextStyle(color: AppColors.white),
                        ),
                      )
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
            ).pOnly(bottom: 40, left: 20, right: 20),
          ],
        ),
      ),
    );
  }
}
