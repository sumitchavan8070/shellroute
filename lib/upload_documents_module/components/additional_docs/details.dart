import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/constants/text_styles.dart';
import 'package:testinggetx/login_module/components/enter_form_field.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/text_form_validator.dart';

class DocumentName extends StatefulWidget {
  const DocumentName({
    super.key,
  });

  @override
  State<DocumentName> createState() => _DocumentNameState();
}

GetXMainController controller = Get.find<GetXMainController>();

class _DocumentNameState extends State<DocumentName> {
  TextEditingController nameController = TextEditingController();
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
            const Text(
              'Upload Document',
              style: TextStyle(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter Document", style: blackName,),
                      EnterFormField(
                        controller: nameController,
                        lableText: 'First name document name. Eg. xyz_SOP',
                        onChanged: (value) {
                          if (kDebugMode) {
                            print(nameController.text.toString());
                          }
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
                                if (kDebugMode) {
                                  print(nameController.text.toString());
                                }
                                context.pushNamed(
                                  GoPath.uploadOther,
                                  pathParameters: {
                                    'name': nameController.text.toString(),
                                  },
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
