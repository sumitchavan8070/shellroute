// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testinggetx/login_module/components/phone_no_country_code.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:testinggetx/routes/go_routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Controller/getx_main_controller.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_form_validator.dart';
import '../../constants/text_styles.dart';
import 'button.dart';
import 'enter_form_field.dart';

class LoginTabbar extends StatefulWidget {
  const LoginTabbar({super.key});

  @override
  State<LoginTabbar> createState() => _LoginTabbarState();
}

class _LoginTabbarState extends State<LoginTabbar> with SingleTickerProviderStateMixin {
  bool show = false;
  TextEditingController mobileController = TextEditingController();
  TextEditingController email = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final loginEmailFormKey = GlobalKey<FormState>();
  FocusNode myFocusNode = FocusNode();
    @override
    Widget build(BuildContext context) {
      final controller = Get.put(GetXMainController());
      return SizedBox(
          height: 350,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0, vertical: 0),
                  child: Container(
                    height: 55,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.appBar.withOpacity(0.6),
                    ),
                    child: TabBar(
                        indicatorPadding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        // controller: tabcontroller,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 1)
                          ],
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        isScrollable: false,
                        // padding: const EdgeInsets.symmetric(horizontal: 15),
                        labelColor:
                        AppColors.primary,
                        // Tab bar selected Label Color..
                        unselectedLabelColor: AppColors.subtitle,
                        indicatorColor: Colors.transparent,
                        tabs: [
                          Tab(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Mobile Number", style: tabbar),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Email", style: tabbar),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TabBarView(children: [
                    Form(
                      key: loginFormKey,
                      child: Column(
                        children: [
                          Obx(
                                () =>
                                PhoneNoEnterForm(
                                  autofocus: true,
                                    focusNode: myFocusNode,
                                    errorText: controller.phoneNumberError
                                        .value == '' ? null : controller
                                        .phoneNumberError.value,
                                    keyboardType: TextInputType.phone,
                                    lableText: "Enter Mobile Number",
                                    hintText: "Mobile Number",
                                    controller: mobileController,
                                    onChanged: (phoneNumber) {
                                      controller.validatePhone(number: phoneNumber);
                                      // numberValidator(number: phoneNumber);
                                    },
                                    validator: (phoneNumber) {
                                      controller.validatePhone(number: phoneNumber?.number);
                                      return null;
                                    }),
                          ),
                          EnterPasswordField(
                            inputFormatters: [AlphanumericFormatter()],
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Phone number and Password";
                              }
                              return null;
                            },
                            lableText: "Password",
                            obscureText: true,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                if (kDebugMode) {
                                  print("object");
                                }
                                context.pushNamed(GoPath.forgotPassword);
                              },
                              child: Text("Forgot Password?",
                                  textAlign: TextAlign.center,
                                  style: linkText)
                                  .pOnly(top: 5),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SubmitButton(
                            title: "Submit",
                            onPressed: () async{
                              // controller.numberValidator(number: mobileController.text);
                              if (loginFormKey.currentState?.validate() ??  false) {
                                var sharedPref = await SharedPreferences.getInstance();
                                sharedPref.setBool(controller.isLoggedIn.value, true);
                                var onboardOver = sharedPref.getBool(controller.onboardOver.value);
                                if(onboardOver == true){
                                  goRouter.go(GoPath.homePage);
                                }
                                else{
                                  goRouter.go(GoPath.welcome);
                                }
                                // controller.onboardOver == false
                                //     ?
                                //     :
                              }
                            },
                          ),
                        ],
                      ).pSymmetric(h: 10),
                    ),
                    Form(
                      key: loginEmailFormKey,
                      child: Column(
                        children: [
                          EnterFormField(
                            inputFormatters: [EmailAndDomainFormatter()],
                            controller: email,
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Email Id";
                              }
                              return null;
                            },
                            lableText: 'Enter Email Id',
                          ),
                          EnterPasswordField(
                            inputFormatters: [AlphanumericFormatter()],
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter password";
                              }
                              return null;
                            },
                            lableText: "Password",
                            obscureText: true,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                if (kDebugMode) {
                                  print("object");
                                }
                                context.pushNamed(GoPath.forgotPassword);
                              },
                              child: Text("Forgot Password?",
                                  textAlign: TextAlign.center,
                                  style: linkText)
                                  .pOnly(top: 5),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SubmitButton(
                            title: "Submit",
                            onPressed: () async{
                              // controller.numberValidator(number: mobileController.text);
                              if (loginEmailFormKey.currentState?.validate() ??  false) {
                                var sharedPref = await SharedPreferences.getInstance();
                                sharedPref.setBool(controller.isLoggedIn.value, true);
                                var onboardOver = sharedPref.getBool(controller.onboardOver.value);
                                if(onboardOver == true){
                                  goRouter.go(GoPath.homePage);
                                }
                                else{
                                  goRouter.go(GoPath.welcome);
                                }
                                // controller.onboardOver == false
                                //     ?
                                //     :
                              }
                            },
                          ),
                        ],
                      ).pSymmetric(h: 10),
                    ),
                  ]).paddingOnly(top: 10),
                )
              ],
            ),
          ));
    }
  }