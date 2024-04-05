import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/login_module/components/enter_form_field.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/text_form_validator.dart';

class LORDetails extends StatefulWidget {
  const LORDetails({
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
  State<LORDetails> createState() => _LORDetailsState();
}

GetXMainController controller = Get.find<GetXMainController>();

class _LORDetailsState extends State<LORDetails> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              '${widget.title1} Details',
              style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      EnterFormField(
                        lableText: 'Recommender’s Name',
                        onChanged: (value) {
                          controller.values(
                            key: 'recommendersName',
                            value: value,
                            map: widget.title1 == "LOR1"
                                ? controller.lorDetails1
                                : controller.lorDetails2,
                          );
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Enter this field";
                          }
                          return null;
                        },
                        inputFormatters: [OnlyCharactersFormatter()],
                      ),
                      const HeightBox(10),
                      EnterFormField(
                        lableText: 'Recommender’s Designation',
                        onChanged: (value) {
                          controller.values(
                            key: 'recommendersDesignation',
                            value: value,
                            map: widget.title1 == "LOR1"
                                ? controller.lorDetails1
                                : controller.lorDetails2,
                          );
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Enter this field";
                          }
                          return null;
                        },
                        inputFormatters: [OnlyCharactersFormatter()],
                      ),
                      const HeightBox(10),
                      EnterFormField(
                        lableText: 'Official Email Id',
                        onChanged: (value) {
                          controller.values(
                            key: 'officialEmailId',
                            value: value,
                            map: widget.title1 == "LOR1"
                                ? controller.lorDetails1
                                : controller.lorDetails2,
                          );
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Enter this field";
                          }
                          return null;
                        },
                        inputFormatters: [EmailAndDomainFormatter()],
                      ),
                      const HeightBox(10),
                      EnterFormField(
                        lableText: 'Relation with the Student',
                        onChanged: (value) {
                          controller.values(
                            key: 'relationWithStudent',
                            value: value,
                            map: widget.title1 == "LOR1"
                                ? controller.lorDetails1
                                : controller.lorDetails2,
                          );
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "Enter this field";
                          }
                          return null;
                        },
                        inputFormatters: [OnlyCharactersFormatter()],
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
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                ),
                              ),
                              elevation:
                              const MaterialStatePropertyAll(0),
                              backgroundColor:
                              const MaterialStatePropertyAll(
                                  AppColors.primary),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                final name = widget.mapName;
                                String? index = widget.index;
                                context.pushNamed(
                                  GoPath.lorUpload,
                                  pathParameters: {
                                    'title1': widget.title1.toString(),
                                    'title2': widget.title2.toString(),
                                    'index': index.toString(),
                                  },
                                  extra: name,
                                );
                              }
                            },
                            child: const Text(
                              "NEXT",
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
                ).pOnly(bottom: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
