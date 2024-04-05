import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/app_colors.dart';
import '../../constants/text_form_validator.dart';
import '../controller/getx_controller.dart';
import 'enter_form_field.dart';
import 'date_enter_form.dart';

GetController _getHavePassportController = Get.find<GetController>();

class YesNoExpansion extends StatefulWidget {
  const YesNoExpansion({
    super.key,
    required this.lableText,
    required this.controller,
    required this.controller1,
    required this.controller2,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
  });

  final Function(String)? onChanged;
  final bool autocorrect;
  final TextEditingController controller;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextInputType keyboardType;
  final String lableText;
  final bool obscureText;

  @override
  State<YesNoExpansion> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<YesNoExpansion> {
  bool yes = true;
  bool no = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.secondaryBg,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.lableText,
                    style:
                        const TextStyle(color: AppColors.title, fontSize: 16),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 0, bottom: 0, right: 5, left: 5),
                    height: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 24,
                          decoration: yes
                              ? BoxDecoration(
                                  color: AppColors.bg,
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.14),
                                        blurRadius: 6.0,
                                        offset: Offset(0.0, 0.0))
                                  ],
                                )
                              : BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                          alignment: Alignment.center,
                          child: Text(
                            'Yes',
                            style: TextStyle(
                                color: yes ? AppColors.primary : AppColors.bg,
                                fontSize: 16),
                          ),
                        ).onTap(
                          () {
                            setState(
                              () {
                                yes = true;
                                // no = false;
                              },
                            );
                            debugPrint('yes $yes no $no');
                            _getHavePassportController.values(
                              key: 'passport_status',
                              value: yes ? '1' : '0',
                              map: _getHavePassportController
                                  .personalInformation,
                            );
                          },
                        ),
                        Container(
                          width: 50,
                          height: 24,
                          decoration: yes
                              ? BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(40),
                                )
                              : BoxDecoration(
                                  color: AppColors.bg,
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.14),
                                          blurRadius: 6.0,
                                          offset: Offset(0.0, 0.0))
                                    ]),
                          alignment: Alignment.center,
                          child: Text(
                            'No',
                            style: TextStyle(
                                color: yes ? AppColors.bg : AppColors.primary,
                                fontSize: 16),
                          ),
                        ).onTap(
                          () {
                            setState(() {
                              yes = false;
                              // no = true;
                            });
                            debugPrint('yes $yes no $no');
                            _getHavePassportController.values(
                              key: 'passport_status',
                              value: yes ? '1' : '0',
                              map: _getHavePassportController
                                  .personalInformation,
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  if (yes == true) ...[
                    enterFormField(
                      inputFormatters: [AlphanumericFormatter()],
                      validator:(value) {
                        if(value?.isEmpty ?? false){
                          return "Enter this field";
                        }
                        return null;
                      },
                      lableText: "Enter your Passport Number",
                      controller: widget.controller1,
                      onChanged: (value) {
                        _getHavePassportController.values(
                            key: 'passport_number',
                            value: value,
                            map:
                                _getHavePassportController.personalInformation);
                      },
                    ).pOnly(top: 10),
                    DateEnterForm(
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter this field";
                        }
                        return null;
                      },
                      mapName: _getHavePassportController.personalInformation,
                      lableText: "Enter your Date of Expiration",
                      keyboardType: TextInputType.datetime,
                      controller: widget.controller2,
                      value: 'passport_expiry',
                    ),
                  ] else ...[
                    Container(),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
