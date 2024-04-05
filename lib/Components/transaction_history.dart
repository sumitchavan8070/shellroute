import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/constants/app_colors.dart';
import '../Controller/getx_main_controller.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Transaction History',
              style: TextStyle(
                color: Color(0xFF24292D),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text('Track all your transaction history here!',
              style: TextStyle(
                color: Color(0xFF747579),
                fontSize: 15,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ).paddingOnly(top: 5, bottom: 25),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.transactionHistory.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: AppColors.shadow),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
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
                              Text(controller.transactionHistory[index].date,
                                style: const TextStyle(
                                  color: Color(0xFF747579),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          SvgPicture.asset("assets/images/downloadBlack.svg")
                          
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Purpose:',
                            style: TextStyle(
                              color: Color(0xFF24292D),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ).paddingOnly(right: 10),
                          Text(controller.transactionHistory[index].purpose,
                            style: const TextStyle(
                              color: Color(0xFF747579),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                        ],
                      ).paddingSymmetric(vertical: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Amount:',
                            style: TextStyle(
                              color: Color(0xFF24292D),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ).paddingOnly(right: 10),
                          Text(controller.transactionHistory[index].amount,
                            style: const TextStyle(
                              color: Color(0xFF747579),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                        ],
                      ).paddingOnly(bottom: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Status:',
                            style: TextStyle(
                              color: Color(0xFF24292D),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ).paddingOnly(right: 10),
                          controller.transactionHistory[index].success == true
                          ?const Text(
                            'Success',
                            style: TextStyle(
                              color: Color(0xFF3DC31C),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                          :const Text(
                            'Failed',
                            style: TextStyle(
                              color: Color(0xFFE33D3D),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                );
              },
            )

          ],
        ),
      ),
    );
  }
}
