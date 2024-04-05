import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Components/custom_app_bar.dart';
import 'package:testinggetx/Components/changepassword_bottom_sheet.dart';
import 'package:testinggetx/constants/app_colors.dart';
import '../Controller/getx_main_controller.dart';

class LoginDetails extends StatelessWidget {
  const LoginDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(),),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Login Details',
                style: TextStyle(
                  color: Color(0xFF24292D),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width ,
                child: const Text('Manage your email address mobile number and password',
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xFF747579),
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ).paddingOnly(top: 5, bottom: 25),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0x3F747579)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Text('Transactions Date:',
                                style: TextStyle(
                                  color: Color(0xFF24292D),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ).paddingOnly(right: 10),
                              Text(controller.transactionHistory[0].date,
                                style: const TextStyle(
                                  color: Color(0xFF747579),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/veified.svg").paddingOnly(right: 5),
                              const Text('Verified',
                                style: TextStyle(
                                  color: Color(0xFF3DC31C),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                    ),
                    const Divider(color: AppColors.shadow,height: 1,thickness: 1,).paddingSymmetric(vertical: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Text('Email Id:',
                                style: TextStyle(
                                  color: Color(0xFF24292D),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ).paddingOnly(right: 10),
                              const Text("xyz@gmail.com",
                                style: TextStyle(
                                  color: Color(0xFF747579),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/veified.svg").paddingOnly(right: 5),
                              const Text('Verified',
                                style: TextStyle(
                                  color: Color(0xFF3DC31C),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                    ),
                    const Divider(color: AppColors.shadow,height: 1,thickness: 1,).paddingSymmetric(vertical: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Text('Password:',
                                style: TextStyle(
                                  color: Color(0xFF24292D),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ).paddingOnly(right: 10),
                              const Text("********",
                                style: TextStyle(
                                  color: Color(0xFF747579),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              changePasswordBottomsheet(
                                  context: context,
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                              );
                            },
                            child: const Text('Change Password?',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )

                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
