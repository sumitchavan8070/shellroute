import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Components/snackbar.dart';
import '../../constants/app_colors.dart';
import '../components/dropdown_selection.dart';
import '../components/normal_dropdown.dart';
import '../controller/getx_controller.dart';

class EducationDetails extends StatefulWidget {
  const EducationDetails({super.key});

  @override
  State<EducationDetails> createState() => _EducationDetailsState();
}

final PageController _viewPageController = PageController(keepPage: false);
GetController _getXController = Get.find<GetController>();
TextEditingController qualification = TextEditingController();
TextEditingController admissionYear = TextEditingController();
TextEditingController passingYear = TextEditingController();
TextEditingController stream = TextEditingController();
TextEditingController educationBoard = TextEditingController();
TextEditingController gradePercentage = TextEditingController();
TextEditingController gradeType = TextEditingController();
TextEditingController medium = TextEditingController();

class _EducationDetailsState extends State<EducationDetails> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              NormalDropDown(
                filtertext: 'Select Education',
                lableText: "Education you pursued in High-school",
                lists: _getXController.highestEducationList,
                mapKey: 'qualification',
                mapName: _getXController.firstEducation,
              ).pOnly(bottom: 25),
              Obx(
                    () => _getXController.firstEducation['qualification'] ==
                    'Class 10th' ||
                    _getXController.firstEducation['qualification'] ==
                        'Class 12th' ||
                    _getXController.firstEducation['qualification'] ==
                        'Diploma'
                    ? Row(children: [
                  Expanded(
                    child: SizedBox(
                      child: NormalDropDown(
                        filtertext: 'Select Education',
                        lableText: "End Date",
                        lists: const [
                          "End year(yyyy)",
                          '2001',
                          '2002',
                          '2003',
                          '2004',
                          '2005',
                          '2006',
                          '2007',
                          '2008',
                          '2009',
                          '20010',
                          '2011',
                          '2012'
                        ],
                        mapKey: 'passing_year',
                        mapName: _getXController.firstEducation,
                      ),
                    ),
                  ),
                ])
                    : Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: NormalDropDown(
                          filtertext: 'Select Education',
                          lableText: "Start Date",
                          lists: const [
                            "Start year(yyyy)",
                            '2001',
                            '2002',
                            '2003',
                            '2004',
                            '2005',
                            '2006',
                            '2007',
                            '2008',
                            '2009',
                            '20010',
                            '2011',
                            '2012',
                          ],
                          mapKey: 'admission_year',
                          mapName: _getXController.firstEducation,
                        ),
                      ),
                    ),
                    const WidthBox(15),
                    Expanded(
                      child: SizedBox(
                        child: NormalDropDown(
                          filtertext: 'Select Education',
                          lableText: "End Date",
                          lists: const [
                            "End year(yyyy)",
                            '2001',
                            '2002',
                            '2003',
                            '2004',
                            '2005',
                            '2006',
                            '2007',
                            '2008',
                            '2009',
                            '20010',
                            '2011',
                            '2012',
                          ],
                          mapKey: 'passing_year',
                          mapName: _getXController.firstEducation,
                        ),
                      ),
                    )
                  ],
                ),
              ).pOnly(bottom: 25),
              DropDownSelection(
                filtertext: 'Select Stream',
                lableText: "Stream in 12th/Diploma",
                lists: _getXController.state?.courses,
                mapKey: 'stream',
                mapName: _getXController.firstEducation,
                onModalClose: (state, confirmed) {
                  if (_getXController.isEmpty.value == true) {
                    if (_getXController.firstEducation['stream'] == '') {
                      _getXController.showAlert.value = false;
                      _getXController.isEmpty.value == false;
                    }
                    // _getXController.showAlert.value = true;
                  }
                },
              ).pOnly(bottom: 25),
              // ! board name
              DropDownSelection(
                onModalClose: (state, confirmed) {
                  if (_getXController.isEmpty.value == true) {
                    if (_getXController.firstEducation['education_board'] ==
                        '') {
                      _getXController.showAlert.value = false;
                      _getXController.isEmpty.value == false;
                    }
                    // _getXController.showAlert.value = true;
                  }
                },
                filtertext: 'Board Name',
                lableText: "Select Your Board",
                lists: _getXController.state?.educationBoards,
                mapKey: 'education_board',
                mapName: _getXController.firstEducation,
              ).pOnly(bottom: 25),
              //! marks obtaine row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex:3,
                    child: TextFormField(
                      controller: gradePercentage,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter this field";
                        }
                        return null;
                      },
                      autocorrect: false,
                      onChanged: (value) {
                        _getXController.values(
                          key: 'grade_percentage',
                          value: value,
                          map: _getXController.firstEducation,
                        );
                      },
                      style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 05),
                        labelText: "Mark Obtained",
                      ),
                    ).pOnly(top: 3),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex:3,
                    child: NormalDropDown(
                      filtertext: 'Percentage',
                      lableText: "Percentage",
                      lists: const ['Mark Obtained', 'Percentage', 'CGPA'],
                      mapKey: 'grade_type',
                      mapName: _getXController.firstEducation,
                    ),
                  ),
                ],
              ),
              NormalDropDown(
                filtertext: 'Medium',
                lableText: "Medium of instruction",
                lists: const ['Medium', 'Hindi', 'English', 'Other'],
                mapKey: 'medium',
                mapName: _getXController.firstEducation,
              ).pOnly(top: 25),
              const SizedBox(height: 25,),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            backgroundColor: MaterialStatePropertyAll(
                                AppColors.buton)),
                        onPressed: () {
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
                        child: _getXController.educationDetails.isEmpty
                            ? const Text(
                          "SKIP",
                          style: TextStyle(color: AppColors.subtitle),
                        )
                            : const Text(
                          "CANCEL",
                          style: TextStyle(color: AppColors.subtitle),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: Obx(
                            () => ElevatedButton(
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            backgroundColor:
                            MaterialStatePropertyAll(AppColors.primary),
                          ),
                          onPressed: () async {
                            int? statusCode;
                            if (_formKey.currentState?.validate() ??
                                false) {
                              // checking if qualification already exits or not
                              if (!_getXController.educationDetails.any(
                                    (element) =>
                                element.values.elementAt(1) ==
                                    _getXController.firstEducation.values
                                        .elementAt(1),
                              )) {
                                // Checking for validation empty
                                debugPrint("post start");
                                _getXController.isLoading.value = true;
                                _getXController.isLoading.value = false;
                                if (statusCode == 1) {
                                  debugPrint('successes!!!!');
                                  RxMap<String, dynamic> testVar =
                                  RxMap(_getXController.firstEducation);
                                  _viewPageController.jumpToPage(1);
                                  _getXController.educationDetails
                                      .add(testVar);
                                } else {
                                  debugPrint('fails!!!!');
                                  // snackbar(context, status);
                                }
                                _getXController.isLoading.value = false;
                              }
                              else{
                                snackbar(context, 'Education already exits!!');
                              }
                            }
                          },
                          child: _getXController.isLoading.value
                              ? Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 13),
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(
                                backgroundColor: AppColors.bg,
                              ))
                              : _getXController.educationDetails.isEmpty
                              ? const Text(
                            "PROCEED",
                            style: TextStyle(color: AppColors.bg),
                          )
                              : const Text(
                            "ADD",
                            style: TextStyle(color: AppColors.bg),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).pOnly(top: 30, bottom: 20),
              // Obx(() => Text('${_getXController.firstEducation}')),
            ],
          ),
        ),
      ),
    );
  }
}

class EduDetailsTileView extends StatefulWidget {
  const EduDetailsTileView({super.key});

  @override
  State<EduDetailsTileView> createState() => _EduDetailsTileViewState();
}

class _EduDetailsTileViewState extends State<EduDetailsTileView> {
  Map<String, dynamic> emptyMap = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: _getXController.educationDetails.length,
              itemBuilder: (context, index) {
                return _getXController.educationDetails[index]
                                ['qualification'] ==
                            'Class 10th' ||
                        _getXController.educationDetails[index]
                                ['qualification'] ==
                            'Class 12th' ||
                        _getXController.educationDetails[index]
                                ['qualification'] ==
                            'Diploma'
                    // shows only end year
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10),
                          color: AppColors.secondaryBg,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _getXController.educationDetails[index]
                                      ['qualification'],
                                  style: const TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),

                                const Icon(
                                  Icons.edit,
                                  color: AppColors.primary,
                                ).onTap(() {
                                  _getXController.update();
                                  _getXController.firstEducation =
                                      _getXController.educationDetails[index];
                                  _viewPageController.jumpTo(0);
                                  _getXController.educationDetails
                                      .removeAt(index);
                                }),
                              ],
                            ).pSymmetric(h: 5),
                            const Divider(
                              thickness: 1,
                              // : double.infinity,
                              color: AppColors.border,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "End Year",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    _getXController.educationDetails[index]
                                        ['passing_year'],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ).pSymmetric(h: 5, v: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Stream",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    _getXController.educationDetails[index]
                                        ['stream'],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ).pSymmetric(h: 5, v: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Board",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    _getXController.educationDetails[index]
                                        ['education_board'],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ).pSymmetric(h: 5, v: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Mark",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '${_getXController.educationDetails[index]['grade_percentage']} ${_getXController.educationDetails[index]['grade_type']}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ).pSymmetric(h: 5, v: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Medium",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    _getXController.educationDetails[index]
                                        ['medium'],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ).pSymmetric(h: 5, v: 4),
                          ],
                        ),
                      ).pOnly(left: 20, right: 20, top: 2)
                    // shows both start year and end year
                    : Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10),
                          color: AppColors.secondaryBg,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _getXController.educationDetails[index]
                                      ['qualification'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                const Icon(
                                  Icons.edit,
                                  color: AppColors.primary,
                                ).onTap(() {
                                  debugPrint(
                                      'map befor delet ${_getXController.educationDetails}');
                                  _getXController.update();
                                  _getXController.firstEducation =
                                      _getXController.educationDetails[index];
                                  _viewPageController.jumpTo(0);
                                  _getXController.educationDetails
                                      .removeAt(index);
                                  debugPrint(
                                      'map after delet ${_getXController.educationDetails}');
                                }),
                              ],
                            ).pSymmetric(h: 5),
                            const Divider(
                              thickness: 1,
                              // : double.infinity,
                              color: AppColors.border,
                            ),
                            SizedBox(
                              height: 20,
                              width: MediaQuery.of(context).size.width - 70,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Start Year",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        const WidthBox(20),
                                        Text(
                                          _getXController
                                                  .educationDetails[index]
                                              ['admission_year'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ).pOnly(right: 30)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "End Year",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ).pOnly(left: 45),
                                        Text(
                                          _getXController
                                                  .educationDetails[index]
                                              ['passing_year'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ).pSymmetric(h: 5, v: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Stream",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    _getXController.educationDetails[index]
                                        ['stream'],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ).pSymmetric(h: 5, v: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Board",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    _getXController.educationDetails[index]
                                        ['education_board'],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ).pSymmetric(h: 5, v: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Mark",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '${_getXController.educationDetails[index]['grade_percentage']} ${_getXController.educationDetails[index]['grade_type']}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ).pSymmetric(h: 5, v: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Medium",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    _getXController.educationDetails[index]
                                        ['medium'],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ).pSymmetric(h: 5, v: 4),
                          ],
                        ),
                      ).pOnly(left: 20, right: 20, top: 2);
              },
            ),
          ),
          SizedBox(
            height: 21,
            width: 78,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 21,
                  width: 78,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: Text(
                    "Add More +",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ).onTap(
                  () {
                    gradePercentage.clear();

                    _getXController.firstEducation
                        .updateAll((key, value) => '');
                    _getXController.update();
                    _viewPageController.jumpTo(0);
                  },
                )
              ],
            ),
          ).pOnly(top: 7, right: 25),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(0),
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.buton)),
                    onPressed: () {
                      _viewPageController.jumpToPage(1);
                    },
                    child: const Text(
                      "SKIP",
                      style: TextStyle(color: AppColors.subtitle),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.primary),
                    ),
                    onPressed: () {
                      if (_getXController.pagers.value < 5) {
                        _getXController.pagers.value =
                            _getXController.pagers.value + 1;
                      }

                      // if (_getXController.isEmpty.value == true) {
                      //   // if(widget.mapName![widget.mapKey] == '' ){
                      //
                      //   _getXController.showAlert.value = true;
                      //   debugPrint(
                      //       'show alerat form on pre edu ${_getXController.showAlert.value}');
                      // }
                      // if (_getXController.firstEducation['stream'] ==
                      //     '' &&
                      //     _getXController
                      //         .firstEducation['education_board'] ==
                      //         '') {
                      //   _getXController.showAlert.value = true;
                      // }
                      // if (_formKey.currentState?.validate() ?? false) {
                      //   _viewPageController.jumpToPage(1);
                      //   RxMap<String, dynamic> testVar =
                      //   RxMap(_getXController.firstEducation);
                      //   _getXController.educationDetails.add(testVar);
                      //   debugPrint(
                      //       ' after adding edu de ${_getXController.educationDetails}');
                      // }
                    },
                    child: const Text(
                      "PROCEED",
                      style: TextStyle(color: AppColors.bg),
                    ),
                  ),
                ),
              ),
            ],
          ).pOnly(top: 30, bottom: 20, left: 20, right: 20),
        ],
      ),
    );
  }
}

class EduTest extends StatefulWidget {
  const EduTest({super.key});

  @override
  State<EduTest> createState() => _EduTestState();
}

class _EduTestState extends State<EduTest> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _viewPageController,
      children: const [EducationDetails(), EduDetailsTileView()],
    );
  }
}
