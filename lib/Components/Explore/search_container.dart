import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Components/Explore/apply.dart';
import 'package:testinggetx/Components/Explore/multi_select_list.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/login_module/components/enter_form_field.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}
final controller = Get.put(GetXMainController());

class _SearchCountryState extends State<SearchCountry> {
  final countryFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
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
              Navigator.pop(context);
              controller.tempCountry.clear();
            }),
            const WidthBox(8),
            const Text(
              'Country',
              style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Apply(
        onPressed: () {
          if(countryFormKey.currentState?.validate()??false){
            controller.selectedCountry.clear();
            controller.selectedCountry.insertAll(0, controller.tempCountry);
            context.go(GoPath.explore);
          }
        },
        onPressedClear: () {
          controller.selectedCountry.clear();
          controller.tempCountry.clear();
        },
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Form(
            key: countryFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Country", style: blackName,).paddingOnly(left: 10, top: 15),
                MultiSelectList(
                    list: controller.suggestions,
                    list2: controller.selectedCountry,
                    title: "Add up to 3 countries",
                    temp: controller.tempCountry,
                    validator: (values) {
                    if (values == null || values.isEmpty) {
                      return 'Please select at least one Country';
                    }
                    if (values.length > 3) {
                      return 'Please select only three Countries';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 35,),

                Text("Location", style: blackName,).paddingOnly(left: 10,),
                Obx(
                  () => EnterFormField(
                    disable: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.shadow
                        )
                    ),
                    enabled: controller.selectedCountry.length >=2 || controller.tempCountry.length >= 2?false:true,
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 18, left: 10, right: 17, bottom: 12),
                        child: SvgPicture.asset("assets/images/search.svg", fit: BoxFit.fill,),
                      ),
                      lableText: 'Search for State/City',
                      // validator: (value) {
                      //   if (value?.isEmpty ?? false) {
                      //     return "Enter this field";
                      //   }
                      //   return null;
                      // },
                      inputFormatters: [LengthLimitingTextInputFormatter(30)]
                  ),
                ),
                Obx(
                  () => controller.tempCountry.length >=2
                    ? Text("You can't add location with multiple countries selected", style: eventSubtitle,).paddingOnly(bottom: 20, left: 10)
                    : const Text(""),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

/// ////////////////////////////SEARCH COURSES//////////////////////////////////////////

class SearchCourse extends StatefulWidget {
  const SearchCourse({super.key});
  @override
  State<SearchCourse> createState() => _SearchCourseState();
}
class _SearchCourseState extends State<SearchCourse> {
  final courseFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
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
                Navigator.pop(context);
                controller.tempCourses.clear();
              }),
              const WidthBox(8),
              const Text(
                'Courses',
                style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Apply(
          onPressed: () {

            if(courseFormKey.currentState?.validate()??false){
              controller.courses.clear();
              controller.courses.insertAll(0, controller.tempCourses);
              context.go(GoPath.explore);
            }

            // if(controller.tempCourses.length>3){
            //   snackbar(context, "Selected Countries are more than 3");
            // }
            // else{
            //   controller.courses.clear();
            //   controller.courses.insertAll(0, controller.tempCourses);
            //   context.pushNamed(GoPath.bottomBar);
            // }
          },
          onPressedClear: () {
            controller.courses.clear();
            controller.tempCourses.clear();
          },
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Form(
              key: courseFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Courses", style: blackName,).paddingOnly(left: 10, top: 15),
                  MultiSelectList(
                    list: controller.course,
                    list2: controller.courses,
                    title: "Add up to 3 courses",
                    temp: controller.tempCourses,
                    validator: (values) {
                      if (values == null || values.isEmpty) {
                        return 'Please select at least one courses';
                      }
                      if (values.length > 3) {
                        return 'Please select only three courses';
                      }
                      return null;
                    },

                  ),
                  const SizedBox(height: 35,),
                  Text("Average Course Tuition Fee (USD)", style: blackName,).paddingOnly(left: 10,),
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of items in each row
                        mainAxisSpacing: 15.0, // spacing between rows
                        crossAxisSpacing:15.0, // spacing between columns
                        mainAxisExtent: 40, // grid size
                        childAspectRatio: 5.0
                    ),
                    padding: const EdgeInsets.all(8.0), // padding around the grid
                    itemCount: controller.feeRange.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: selectedIndex == index?AppColors.primary:AppColors.shadow),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Center(
                              child: Text(controller.feeRange[index]),
                            ),
                          ),
                        ),
                      );
                    },
                  )


                ],
              ),
            ),
          ),
        )

    );
  }
  int selectedIndex = 0;

}



/// ////////////////////////////SEARCH UNIVERSITY//////////////////////////////////////////
