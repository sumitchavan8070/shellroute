import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/budget_pref_que.dart';
import '../components/proceed_button.dart';
import '../components/snackbar_provider.dart';
import '../controller/getx_controller.dart';

class BudgetPreference extends StatefulWidget {
  const BudgetPreference({super.key});

  @override
  State<BudgetPreference> createState() => _BudgetPreferenceState();
}

final TextEditingController budget = TextEditingController();
final TextEditingController fundSource = TextEditingController();
GetController _getXController = Get.find<GetController>();

class _BudgetPreferenceState extends State<BudgetPreference> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var index = 3;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              BudgetPrefQueOne(
                      lableText:
                          'What is your budget for pursuing Education abroad ? For eg. per year cost of tuition fees and living in following countries is as mentioned below :',
                      controller: budget,
                      palceholder: 'Your Budget (lacs)',
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter this field";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _getXController.values(
                            key: 'budget',
                            value: value,
                            map: _getXController.budgetPreference);
                      },
                      data: '')
                  .pOnly(bottom: 25),
              // budgetFundRaiser()
              const BudgetFundRaiser(
                itemPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                lableText:
                    'How are you planning to fund your education abroad?',
                listsFundRaiser: [
                  'Family Member',
                  'Self',
                  'Education Loan',
                  'Scholarship',
                  'Sponsored Scholarship',
                ],
              ),
              Obx(
                () => _getXController.isEducationLoan.value
                    ? const LoanType(
                        itemPadding:
                            EdgeInsets.symmetric(horizontal: 19, vertical: 12),
                        lableText: 'What type loan are you planning?',
                        mainHeight: 109,
                        loanTypeList: [
                          'Collateral Loan',
                          'Non-Collateral Loan',
                        ],
                      ).pOnly(top: MediaQuery.of(context).size.height * 0.0290)
                    : Container(),
              ),

              // Obx(() => Text('${_getXController.budgetPreference}')),
              const SizedBox(height: 25,),

              ProceedSkipButton(
                pageIndex: index,
                onPressedSkip: () {
                  if (_getXController.pagers.value < 5) {
                    _getXController.pagers.value =
                        _getXController.pagers.value + 1;
                  } else {
                    debugPrint('page view fails');
                  }
                  // snackbar(context, ' add error pop up for already exiting qualification.');
                  // if (_getXController.pagger.value >= 5) {
                  //   _getXController.pagger.value = 0;
                  // } else {
                  //   debugPrint('error in the page view !!');
                  // }
                },
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    int? statusCode;
                    String? status;
                    debugPrint("post start");
                    _getXController.isLoading.value = true;
                    Map<String, dynamic> message =
                        await postDataInstance.onBoardingQuesApiPost(
                      endpoint: '/store_onboard',
                      postData: _getXController.budgetPreference,
                    );
                    _getXController.isLoading.value = false;
                    statusCode = message['status'];
                    status = message['message'].toString();
                    if (statusCode == 1) {
                      _getXController.isLoading.value = false;
                      debugPrint('Post Successes!!!!');
                      snackbar(BuildContext as BuildContext, status.toString());
                      if (_getXController.pagers.value < 5) {
                        _getXController.pagers.value =
                            _getXController.pagers.value + 1;
                      } else {
                        debugPrint('error in the page view !!');
                      }
                    } else {
                      _getXController.isLoading.value = false;
                      debugPrint('Post Fails !!1');
                      snackbar(BuildContext as BuildContext, status.toString());
                    }
                    _getXController.isLoading.value = false;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
