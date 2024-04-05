import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Components/snackbar.dart';
import '../../routes/go_routes.dart';

class UploadConfirmation extends StatefulWidget {
  const UploadConfirmation({
    super.key,
    required this.index,
    required this.title1,
    required this.title2,
    this.mapName,

  });

  final List<PlatformFile>? mapName;
  final String? index;
  final String? title1;
  final String? title2;

  @override
  State<UploadConfirmation> createState() => _UploadConfirmationState();
}

GetXMainController controller = Get.find<GetXMainController>();

class _UploadConfirmationState extends State<UploadConfirmation> {
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
            Text(
              'ADD ${widget.title1}',
              style: const TextStyle(
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
                    color: AppColors.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.title1}',
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
                            onPressed: () async{
                                widget.mapName?[int.parse(widget.index.toString())] =
                                    // controller.localFile[0] ??
                                PlatformFile(
                                    name: widget.title1.toString(),
                                    size: controller.localFile[0].size,
                                    path: controller.localFile[0].name
                                  // path: widget.title1.toString()
                                );
                                snackbar(context,'Perfect! Your ${widget.title1} is Uploaded');
                                if (kDebugMode) {
                                  print(widget.mapName.toString());
                                }
                                // ignore: unrelated_type_equality_checks

                                var sharedPref = await SharedPreferences.getInstance();
                                var onboardOver = sharedPref.getBool(controller.onboardOver.value);
                                if(onboardOver == true){
                                  goRouter.go(GoPath.tabBarDocs);
                                }
                                else{
                                  goRouter.go(GoPath.customStepper);
                                }


                                // controller.onboardOver == true?context.go(GoPath.tabBarDocs):context.go(GoPath.customStepper);

                                controller.localFile[0] = PlatformFile( name: widget.title1.toString(), size: 00, path: null);
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