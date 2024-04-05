import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/constants/text_styles.dart';
import 'package:testinggetx/login_module/components/enter_form_field.dart';
import 'package:testinggetx/upload_documents_module/components/additional_docs/upload_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/text_form_validator.dart';
changePasswordBottomsheet(
    {required BuildContext context,
        required void Function()? onTap}) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    backgroundColor: Colors.white,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            Container(
              height: 54,
              decoration: const ShapeDecoration(
                color: Color(0xFFF5F7F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 7,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: SizedBox(
                      height: 16,
                      width: 18,
                      child: SvgPicture.asset(
                        'assets/images/blackcross.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ),
                    Text(
                  'Change Password?',
                  style: blackName
                )
              ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                children: [
                  EnterPasswordField(
                    inputFormatters: [AlphanumericFormatter()],
                    validator:(value) {
                      if(value?.isEmpty ?? false){
                        return "Enter Password";
                      }
                      return null;
                    },
                    lableText: "Password",
                    obscureText: true,).paddingOnly(bottom: 10, top: 10),
                  EnterPasswordField(
                    inputFormatters: [AlphanumericFormatter()],
                    validator:(value) {
                      if(value?.isEmpty ?? false){
                        return "Enter New Password";
                      }
                      return null;
                    },
                    lableText: "New Password",
                    obscureText: true,).paddingOnly(bottom: 10),
                  EnterPasswordField(
                    inputFormatters: [AlphanumericFormatter()],
                    validator:(value) {
                      if(value?.isEmpty ?? false){
                        return "Enter Confirm Password";
                      }
                      return null;
                    },
                    lableText: "Confirm New Password",
                    obscureText: true,
                  ).paddingOnly(bottom: 35),
                  UploadButton(
                    color: AppColors.primary,
                    title: "Submit",
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    onPressed: onTap
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

