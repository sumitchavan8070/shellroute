import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/app_colors.dart';
import '../../constants/text_form_validator.dart';
import '../controller/getx_controller.dart';

GetController _getXController = Get.find<GetController>();

class BudgetPrefQueOne extends StatefulWidget {
  final String lableText;
  final String data;
  final String? Function(String?)? validator;

  final String palceholder;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;

  final bool autocorrect;
  final Function(String)? onChanged;

  const BudgetPrefQueOne({
    super.key,
    required this.lableText,
    required this.data,
    required this.palceholder,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    required this.validator,
    this.onChanged,
  });

  @override
  State<BudgetPrefQueOne> createState() => _BudgetPrefQueOneState();
}

class _BudgetPrefQueOneState extends State<BudgetPrefQueOne> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController budget = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondaryBg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.lableText,
            style: const TextStyle(
                fontFamily: 'Heebo',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.title),
          ),
          SizedBox(width: double.infinity, child: countryList()),
          TextFormField(
            inputFormatters: [NumberDotFormatter()],
            controller: budget,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            obscureText: false,
            autocorrect: false,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              labelText: widget.palceholder,
            ),
          ).paddingOnly(top: 15),
        ],
      ),
    );
  }
}

List<String> fundRaiser = [];

class BudgetFundRaiser extends StatefulWidget {
  final String lableText;
  final List? listsFundRaiser;
  final EdgeInsetsGeometry? itemPadding;

  const BudgetFundRaiser({
    super.key,
    required this.lableText,
    this.listsFundRaiser,
    this.itemPadding,
  });

  @override
  State<BudgetFundRaiser> createState() => BudgetFundRaiserState();
}

List<bool> selectedFunder = List.filled(5, false);

class BudgetFundRaiserState extends State<BudgetFundRaiser> {
  @override
  Widget build(BuildContext context) {
    List<MultiSelectCard<String>> raiser = List.filled(
        widget.listsFundRaiser?.length ?? 0,
        MultiSelectCard(value: '', label: ''),
        growable: true);

    for (int i = 0; i < (widget.listsFundRaiser?.length ?? 0); i++) {
      raiser[i] = MultiSelectCard(
        label: '${widget.listsFundRaiser?[i]}',
        value: '${widget.listsFundRaiser?[i]}',
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.lableText,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w400,
            ),
          ).pOnly(bottom: 10),
          MultiSelectContainer(
            // height: 44,
            itemsPadding: widget.itemPadding ?? const EdgeInsets.all(0),
            alignments: const MultiSelectAlignments(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max),
            itemsDecoration: MultiSelectDecorations(
              selectedDecoration: BoxDecoration(
                color: AppColors.bg,
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.circular(5),
              ),
              disabledDecoration: BoxDecoration(
                color: AppColors.bg,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(5),
              ),
              decoration: BoxDecoration(
                color: AppColors.bg,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            textStyles: const MultiSelectTextStyles(
              disabledTextStyle: TextStyle(
                  color: AppColors.subtitle,
                  fontFamily: 'Heebo',
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400),
              selectedTextStyle: TextStyle(
                  color: AppColors.primary,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'Heebo',
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              textStyle: TextStyle(
                  color: AppColors.subtitle,
                  fontFamily: 'Heebo',
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            items: raiser,
            wrapSettings: const WrapSettings(spacing: 12, runSpacing: 10),
            onChange: (allSelectedItems, selectedItem) {
              fundRaiser = allSelectedItems;
              setState(() {
                _getXController.budgetPreference['fund_source'] =
                    allSelectedItems;
                _getXController.budgetPreference['fund_source']
                        .contains('Education Loan')
                    ? _getXController.isEducationLoan.value = true
                    : _getXController.isEducationLoan.value = false;
                _getXController.isTapped.value = false;
                _getXController.colleLoan.value = false;
                _getXController.nonColleLoan.value = true;
              });
              _getXController.isEducationLoan.value
                  ? _getXController.budgetPreference['loan_type'] = ''
                  : _getXController.budgetPreference['loan_type'] = '';
            },
          ),
        ],
      ),
    );
  }
}

List<Widget> flag = [
  SizedBox(
    height: 21,
    width: 33,
    child: SvgPicture.asset('assets/images/england.svg'),
  ),
  SizedBox(
    height: 21,
    width: 33,
    child: SvgPicture.asset('assets/images/us.svg'),
  ),
  SizedBox(
    height: 21,
    width: 33,
    child: SvgPicture.asset('assets/images/canada.svg'),
  ),
  SizedBox(
    height: 21,
    width: 33,
    child: SvgPicture.asset('assets/images/australia.svg'),
  ),
];

List<String> countryAmount = [
  'UK (25 - 35 lacs)',
  'USA (30 - 40 lacs)',
  'Canada (16 - 18 lacs)',
  'Australia (28 - 35 lacs)',
];

Widget countryList() {
  return ListView.builder(
    itemCount: 4,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          flag[index].pOnly(top: 15, right: 10),
          Text(
            countryAmount[index],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: 'Heebo',
            ),
          ),
        ],
      );
    },
  );
}

class LoanType extends StatefulWidget {
  final String lableText;
  final List? loanTypeList;
  final double? mainHeight;
  final EdgeInsetsGeometry? itemPadding;

  const LoanType({
    super.key,
    required this.lableText,
    this.loanTypeList,
    this.mainHeight,
    this.itemPadding,
  });

  @override
  State<LoanType> createState() => LoanTypeState();
}

class LoanTypeState extends State<LoanType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      // height: widget.mainHeight ?? 188,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.lableText,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w400,
            ),
          ).pOnly(bottom: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.only(top: 13),
                  decoration: _getXController.colleLoan.value
                      ? BoxDecoration(
                          color: AppColors.bg,
                          border: Border.all(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(5),
                        )
                      : BoxDecoration(
                          color: AppColors.bg,
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(5),
                        ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        '${widget.loanTypeList?[0]}',
                        style: _getXController.colleLoan.value
                            ? const TextStyle(
                                color: AppColors.primary,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Heebo',
                                fontSize: 14,
                                fontWeight: FontWeight.w400)
                            : const TextStyle(
                                color: AppColors.subtitle,
                                fontFamily: 'Heebo',
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ).onTap(() {
                  setState(() {
                    _getXController.colleLoan.value = true;
                    _getXController.nonColleLoan.value = false;
                  });
                  _getXController.colleLoan.value
                      ? _getXController.budgetPreference['loan_type'] =
                          '${widget.loanTypeList?[0]}'
                      : const Text('data');
                }),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  height: 44,
                  decoration: _getXController.isTapped.value
                      ? _getXController.nonColleLoan.value
                          ? BoxDecoration(
                              color: AppColors.bg,
                              border: Border.all(color: AppColors.primary),
                              borderRadius: BorderRadius.circular(5),
                            )
                          : BoxDecoration(
                              color: AppColors.bg,
                              border: Border.all(color: AppColors.border),
                              borderRadius: BorderRadius.circular(5),
                            )
                      : BoxDecoration(
                          color: AppColors.bg,
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.only(top: 13),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        '${widget.loanTypeList?[1]}',
                        style: _getXController.nonColleLoan.value
                            ? _getXController.isTapped.value
                                ? const TextStyle(
                                    color: AppColors.primary,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Heebo',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)
                                : const TextStyle(
                                    color: AppColors.subtitle,
                                    fontFamily: 'Heebo',
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400)
                            : const TextStyle(
                                color: AppColors.subtitle,
                                fontFamily: 'Heebo',
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ).onTap(() {
                  setState(() {
                    _getXController.colleLoan.value = false;
                    _getXController.nonColleLoan.value = true;
                    _getXController.isTapped.value = true;
                  });
                  _getXController.nonColleLoan.value
                      ? _getXController.budgetPreference['loan_type'] =
                          '${widget.loanTypeList?[1]}'
                      : const Text("df");
                  debugPrint(
                      'from nont  ${_getXController.nonColleLoan.value},  coll ${_getXController.colleLoan.value}');
                  debugPrint(
                      'this is controller  ${_getXController.budgetPreference['loanType']}');
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
