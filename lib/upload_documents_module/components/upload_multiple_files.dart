// ignore_for_file: prefer_is_empty, use_build_context_synchronously

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Components/snackbar.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:velocity_x/velocity_x.dart';
import 'upload_concept.dart';

class UploadMultiple extends StatefulWidget {
  const UploadMultiple({
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
  State<UploadMultiple> createState() => _UploadMultipleState();
}

GetXMainController controller = Get.find<GetXMainController>();

  class _UploadMultipleState extends State<UploadMultiple> {
    int counter = 0;
  String calculate(int sizeInBytes) {
    double sizeInMB = sizeInBytes / (1024 * 1024);
    return '${sizeInMB.toDoubleStringAsFixed()} MB';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // onPopUpdate(tempList: widget.mapName, confNo: widget.index);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:AppColors.white,
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
                // onPopUpdate(tempList: widget.mapName, confNo: widget.index);
              }),
              const WidthBox(8),
              Text(
                'Upload ${widget.title1}',
                style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              )
            ],
          ),
        ),
        body: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
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
                    "Supported formats: docx, dox, xlsx, pdf, jpeg, jpg, png, txt",
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
                    () {
                      // debugPrint('print \n\n ${controller.localFileList}');
                      return widget.mapName?.length != 0
                          ? Column(
                              children: [
                                ListView.builder(
                                  itemCount: widget.mapName?.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return widget.mapName![index].size == 0
                                      ?const SizedBox()
                                    :Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 18,
                                                      width: 15,
                                                      child: SvgPicture.asset(
                                                          'assets/images/file.svg'),
                                                    ).pOnly(right: 8),
                                                    SizedBox(
                                                      height: 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.67,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Text(
                                                            widget
                                                                .mapName![index]
                                                                .name,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                color: AppColors
                                                                    .black,
                                                                fontSize: 14),
                                                          ),
                                                          Text(
                                                            'File Size:  ${calculate(widget.mapName?[index].size ?? 0)}',
                                                            style: const TextStyle(
                                                                color: AppColors
                                                                    .subtitle,
                                                                fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // end of the selected file
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 18,
                                                      width: 18,
                                                      child: SvgPicture.asset(
                                                        'assets/images/filereplace.svg',
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ).onTap(() async {
                                                      PlatformFile file =
                                                          pickFile(
                                                              context: context);
                                                      int? filesize =
                                                          file.size;
                                                      if (filesize <
                                                              (10 *
                                                                  1024 *
                                                                  1024) &&
                                                          filesize != 0) {

                                                        widget.mapName?[index] =
                                                       file;
                                                      } else {
                                                        debugPrint('field for the replace');
                                                      }
                                                    }),
                                                    const WidthBox(10),
                                                    SizedBox(
                                                      child: SizedBox(
                                                        height: 18,
                                                        width: 18,
                                                        child: SvgPicture.asset(
                                                            'assets/images/fileremove.svg',
                                                            fit: BoxFit.fill),
                                                      ),
                                                    ).onTap(() {
                                                      widget.mapName
                                                          ?.removeAt(index);
                                                    }),
                                                  ],
                                                ),
                                                const Text('')

                                                /// for sending the text a bit more upper
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 1,
                                          width: double.infinity,
                                          color: AppColors.subtitle,
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                        ),
                                      ],
                                    );
                                  },
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
                                    left: MediaQuery.of(context).size.width *
                                        0.30,
                                    right: MediaQuery.of(context).size.width *
                                        0.30,
                                    top: MediaQuery.of(context).size.height *
                                        0.10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.add),
                                      Text(
                                        'Add File',
                                        style: TextStyle(
                                          color: Color(0xFF24292D),
                                          fontSize: 16,
                                          fontFamily: 'Heebo',
                                          fontWeight: FontWeight.w500,
                                          height: 1.25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ).onTap(() async {
                                  PlatformFile file = await pickFile(context: context);
                                  if (file.size < (10 * 1024 * 1024) &&
                                      file.size != 0) {
                                    controller.isSelected.value = true;
                                    PlatformFile renamedFile = PlatformFile(
                                      name: '${widget.title1} ${counter + 1}' ,
                                      size: file.size,
                                      path: file.path,

                                    );
                                    widget.mapName?.add(renamedFile);
                                    counter++;
                                  } else {
                                    snackbar(context, "File Size Issue");
                                  }
                                }
                                ),
                                const HeightBox(100),
                              ],
                            ).pOnly(left: 20, right: 20)
                          // before selecting file
                          : Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.30,
                                  ),
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
                                ).onTap(() async {
                                  PlatformFile file =
                                      await pickFile(context: context);
                                  if (file.size < (10 * 1024 * 1024) &&
                                      file.size != 0) {
                                    controller.isSelected.value = true;
                                    widget.mapName?.add(file);
                                  } else {
                                    // TODO : add error of file size
                                  }
                                  // TODO : add error of file not selected
                                }),
                              ],
                            );
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(.0, 0.95),
              child: Row(
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
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          AppColors.primary),
                                ),
                                onPressed: () {
                                  if (controller.isSelected.value == true) {
                                    controller.isSelected.value = false;
                                    final mapname = widget.mapName;
                                    final count = widget.mapName!.where((file) => file.size != 0).length;
                                    context.pushNamed(GoPath.uploadConfirmation,
                                        pathParameters: {
                                          'title1': widget.title1.toString(),
                                          'title2':
                                              '$count file added',
                                          'index': widget.index.toString(),
                                        },
                                        extra: mapname);
                                  }
                                  else {
                                    debugPrint('error in file ');
                                    // snackbar(context, 'Error in file ');
                                  }
                                },
                                child: const Text(
                                  "PROCEED",
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
              ).pOnly(bottom: 0, left: 20, right: 20),
            ),
          ],
        ),
      ),
    );
  }
}
