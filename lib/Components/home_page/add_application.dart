// ignore_for_file: must_be_immutable

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/constants/app_colors.dart';
import 'package:testinggetx/constants/text_form_validator.dart';
import 'package:testinggetx/constants/text_styles.dart';
import 'package:testinggetx/routes/go_path.dart';
import '../../Controller/getx_main_controller.dart';
import '../../login_module/components/button.dart';
import '../../login_module/components/enter_form_field.dart';
import '../snackbar.dart';

class AddApplication extends StatefulWidget {
  AddApplication({
    super.key,
    required this.title,
    this.name,
    this.course,
    this.location,
    this.country
  });
  String? title;
  String? name = "";
  String? course = "";
  String? location = "";
  String? country = "";
  @override
  State<AddApplication> createState() => _AddApplicationState();
}

class _AddApplicationState extends State<AddApplication> {
  TextEditingController countryController = TextEditingController();

  String? university = "";
  String? subject = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetXMainController());
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55,
          backgroundColor: Colors.white,
          elevation: 4,
          automaticallyImplyLeading: false,
          leadingWidth: 40,
          leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset("assets/images/cross.svg").paddingOnly(left: 15, bottom: 2))  ,
          title: Text(widget.title.toString(), style: blueAppbarText,),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              key: _formKey,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                    fit: FlexFit.loose,
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      autofocus: true,
                      cursorColor: AppColors.black,
                    )
                    // disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: const ["Columbia University", "Harvard University", "Oxford University",],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: subtitle,
                    dropdownSearchDecoration: InputDecoration(
                      labelText: widget.name?.isEmpty ?? true?"":"University you want to add",
                      labelStyle: subtitle,
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select University';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      university = value;

                    });
                    if (kDebugMode) {
                      print(widget.name);
                    }
                    if (kDebugMode) {
                      print(widget.name?.isEmpty);
                    }
                  },                // selectedItem: "University you want to add",
                  selectedItem: widget.name?.isEmpty ?? true?"University you want to add":widget.name,
                  dropdownButtonProps: DropdownButtonProps(
                      icon: const Icon(Icons.search).paddingOnly(top: 10)
                  ),
                ).paddingOnly(top: 25, bottom: 20),
                university?.isEmpty ?? true? Container(): Column(
                  children: [
                    EnterFormField(
                      lableText: "University Country",
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                        return null;
                        }
                        return null;
                        },
                      inputFormatters: [OnlyCharactersFormatter()]
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/peference.svg").paddingOnly(bottom: 20,right: 8, top: 2),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Text("This country preference will be added to your profile", style: eventSubtitle,).paddingOnly(bottom: 20,)),
                      ],
                    )
                  ],
                ),
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                    fit: FlexFit.loose,
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      autofocus: true,
                      cursorColor: AppColors.black,

                    )
                    // disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: const ["B.Sc", "B.Tech.", "B.Com", 'B.E.'],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: subtitle,
                    dropdownSearchDecoration: InputDecoration(
                      labelText: widget.course?.isEmpty ?? true?"":"Course you want to Study",
                      labelStyle: subtitle,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select Course';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      widget.course = value;
                      subject = value;
                    });
                    if (kDebugMode) {
                      print(widget.course);
                    }
                    if (kDebugMode) {
                      print(widget.course?.isEmpty);
                    }
                  },
                  selectedItem: widget.course?.isEmpty ?? true?"Course you want to add":widget.course,
                  dropdownButtonProps: DropdownButtonProps(
                      icon: const Icon(Icons.search).paddingOnly(top: 10)
                  ),
                ).paddingOnly(bottom: 30),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Your Application Status", style: blackName,)
                ).paddingOnly(bottom: 15),
                Wrap(
                  spacing: 10.0,runSpacing: 10,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    for (int i = 0; i < data.length; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = i;
                            if (kDebugMode) {
                              print(selectedIndex);
                              print(data[i]);
                            }
                          });
                        },
                        child: IntrinsicWidth(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: selectedIndex == i? AppColors.primary:AppColors.black.withOpacity(0.6)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data[i],style: selectedIndex == i?linkText:subtitle,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SubmitButton(title: "Add Application",
                  onPressed: () {
                    if (validateFields()) {
                      controller.addshortlist(university!, subject!);
                      snackbar(context, "Course Shortlisted and you are added to the groups");
                      context.go(GoPath.homePage);
                    } else {
                      snackbar(context, "Please fill in all fields.");
                    }
                  },

                ).paddingOnly(bottom: 15, top: university?.isEmpty ?? true?200:100)
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool validateFields() {
    return university != null && university!.isNotEmpty && subject != null && subject!.isNotEmpty;
  }

  List data = [
   "Shortlisted",
    "Applied",
    "Admit",
    "Reject",
    "WaitList",
    "Final"
  ];
  int selectedIndex = 0;

}

