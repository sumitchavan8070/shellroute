import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/login_module/components/phone_no_country_code.dart';

import '../../constants/text_form_validator.dart';
import '../../login_module/components/enter_form_field.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}
final controller = Get.put(GetXMainController());
class _PersonalInformationState extends State<PersonalInformation> {
  bool isEdit = true;
  TextEditingController alternateMobileController = TextEditingController();
  TextEditingController alternateEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0x3F747579)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: const ShapeDecoration(
              color: AppColors.secondaryBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEdit = !isEdit;
                });
              },
              child: Container(
                child: isEdit == true
                    ?Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Edit',
                          style: TextStyle(
                            color: Color(0xFF24292D),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SvgPicture.asset("assets/images/pen.svg").paddingOnly(left: 5)
                      ],
                    )
                    :Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Save',
                      style: TextStyle(
                        color: Color(0xFF24292D),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SvgPicture.asset("assets/images/save.svg").paddingOnly(left: 5)
                  ],
                ),
              ),
            ),
          ),
          isEdit == true
          ?ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.profileDetails.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(controller.profileDetails[index].svg).paddingOnly(right: 5, bottom: 8),
                        Text(controller.profileDetails[index].data,
                          style: const TextStyle(
                              color: Color(0xFF24292D),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 0.07
                          ),
                        )
                      ],
                    ),
                    const Divider(color: AppColors.shadow, height: 1,thickness: 1,).paddingSymmetric(vertical: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.profileDetails[index].title,
                          style: const TextStyle(
                            color: Color(0xFF747579),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                          ),
                        )
                      ],
                    ).paddingOnly(top: 10)
                  ],
                ),
              );
            },
          ).paddingSymmetric(horizontal: 15)
          :Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: const ShapeDecoration(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/name.svg").paddingOnly(right: 5, bottom: 8),
                          const Text("Divya Jain",
                            style: TextStyle(
                                color: Color(0xFF24292D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 0.07
                            ),
                          )
                        ],
                      ),
                      const Divider(color: AppColors.shadow, height: 1,thickness: 1,).paddingSymmetric(vertical: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Name",
                            style: TextStyle(
                              color: Color(0xFF747579),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          )
                        ],
                      ).paddingOnly(top: 10)
                    ],
                  ),
                ),
                SizedBox(
                  // margin: const EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/number.svg").paddingOnly(right: 5, bottom: 8),
                          const Text("+91 1524852369",
                            style: TextStyle(
                                color: Color(0xFF24292D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 0.07
                            ),
                          )
                        ],
                      ),
                      const Divider(color: AppColors.shadow, height: 1,thickness: 1,).paddingSymmetric(vertical: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Number",
                            style: TextStyle(
                              color: Color(0xFF747579),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          )
                        ],
                      ).paddingOnly(top: 10)
                    ],
                  ),
                ),
                Obx(
                      () =>
                      PhoneNoEnterForm(
                          errorText: controller.phoneNumberError
                              .value == '' ? null : controller
                              .phoneNumberError.value,
                          keyboardType: TextInputType.phone,
                          lableText: "Enter Alternate Mobile Number",
                          hintText: "Alternate Mobile Number",
                          controller: alternateMobileController,
                          onChanged: (phoneNumber) {
                            controller.validatePhone(number: phoneNumber);
                          },
                          validator: (phoneNumber) {
                            controller.validatePhone(number: phoneNumber?.number);
                            return null;
                          }),
                ).paddingOnly(bottom: 20),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/number.svg").paddingOnly(right: 5, bottom: 8),
                          const Text("+91 1524852369",
                            style: TextStyle(
                                color: Color(0xFF24292D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 0.07
                            ),
                          )
                        ],
                      ),
                      const Divider(color: AppColors.shadow, height: 1,thickness: 1,).paddingSymmetric(vertical: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Number",
                            style: TextStyle(
                              color: Color(0xFF747579),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          )
                        ],
                      ).paddingOnly(top: 10)
                    ],
                  ),
                ),
                EnterFormField(
                  inputFormatters: [EmailAndDomainFormatter()],
                  controller: alternateEmailController,
                  icon: SvgPicture.asset("assets/images/email.svg", height: 10,).paddingOnly(left: 0, top: 20,right: 10, bottom: 16),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter Email Id";
                    }
                    return null;
                  },
                  lableText: 'Enter Alternate Email Id',
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/dob.svg").paddingOnly(right: 5, bottom: 8),
                          const Text("1997-09-13",
                            style: TextStyle(
                                color: Color(0xFF24292D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 0.07
                            ),
                          )
                        ],
                      ),
                      const Divider(color: AppColors.shadow, height: 1,thickness: 1,).paddingSymmetric(vertical: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Date of Birth",
                            style: TextStyle(
                              color: Color(0xFF747579),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          )
                        ],
                      ).paddingOnly(top: 10)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/gender.svg").paddingOnly(right: 5, bottom: 8),
                          const Text("Female",
                            style: TextStyle(
                                color: Color(0xFF24292D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 0.07
                            ),
                          )
                        ],
                      ),
                      const Divider(color: AppColors.shadow, height: 1,thickness: 1,).paddingSymmetric(vertical: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Gender",
                            style: TextStyle(
                              color: Color(0xFF747579),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          )
                        ],
                      ).paddingOnly(top: 10)
                    ],
                  ),
                ),
                EnterFormField(
                  inputFormatters: [NumberDotFormatter()],
                  controller: alternateEmailController,
                  icon: SvgPicture.asset("assets/images/passportNumber.svg", height: 10,).paddingOnly(left: 0, top: 15,right: 10, bottom: 12),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter Passport Number";
                    }
                    return null;
                  },
                  lableText: 'Enter Passport Number',
                ),
                EnterFormField(
                  inputFormatters: [NumberDotFormatter()],
                  controller: alternateEmailController,
                  icon: SvgPicture.asset("assets/images/doe.svg", height: 10,).paddingOnly(left: 5, top: 15,right: 10, bottom: 12),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return "Enter Passport Date of Expiration";
                    }
                    return null;
                  },
                  lableText: 'Enter Passport Date of Expiration',
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/country.svg").paddingOnly(right: 5, bottom: 8),
                          const Text("United Kingdom",
                            style: TextStyle(
                                color: Color(0xFF24292D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 0.07
                            ),
                          )
                        ],
                      ),
                      const Divider(color: AppColors.shadow, height: 1,thickness: 1,).paddingSymmetric(vertical: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Country",
                            style: TextStyle(
                              color: Color(0xFF747579),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          )
                        ],
                      ).paddingOnly(top: 10)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/state.svg").paddingOnly(right: 5, bottom: 8),
                          const Text("London",
                            style: TextStyle(
                                color: Color(0xFF24292D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 0.07
                            ),
                          )
                        ],
                      ),
                      const Divider(color: AppColors.shadow, height: 1,thickness: 1,).paddingSymmetric(vertical: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "State",
                            style: TextStyle(
                              color: Color(0xFF747579),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          )
                        ],
                      ).paddingOnly(top: 10)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/city.svg").paddingOnly(right: 5, bottom: 8),
                          const Text("Newport",
                            style: TextStyle(
                                color: Color(0xFF24292D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 0.07
                            ),
                          )
                        ],
                      ),
                      const Divider(color: AppColors.shadow, height: 1,thickness: 1,).paddingSymmetric(vertical: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "City",
                            style: TextStyle(
                              color: Color(0xFF747579),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          )
                        ],
                      ).paddingOnly(top: 10)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/VisaRefusal.svg").paddingOnly(right: 5, bottom: 8),
                          const Text("No",
                            style: TextStyle(
                                color: Color(0xFF24292D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 0.07
                            ),
                          )
                        ],
                      ),
                      const Divider(color: AppColors.shadow, height: 1,thickness: 1,).paddingSymmetric(vertical: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Visa Refusal",
                            style: TextStyle(
                              color: Color(0xFF747579),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          )
                        ],
                      ).paddingOnly(top: 10)
                    ],
                  ),
                ),



              ],
            ),
          )
        ],
      ),
    );
  }
}
