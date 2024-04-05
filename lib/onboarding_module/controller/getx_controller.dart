import 'package:awesome_select/awesome_select.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Modals/onBoardingDataModel.dart';
import '../provider/get_onboarding_queget_call.dart';

class GetController extends GetxController
    with StateMixin<OnBoardingDataModel> {
  ///? instance of api call
  GetOnboardingQuesClass onBoardingQues = GetOnboardingQuesClass();
  RxInt pagers = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isSelected = false.obs;
  // RxBool isSelectedLor = false.obs;
  // RxBool isSelectedMultiple = false.obs;

  RxList<PlatformFile> highSchoolDocs = [
    PlatformFile(name: 'controllerFile', size: 0),
    PlatformFile(name: 'controllerFile', size: 0)
  ].obs;

  /// for string files

  RxList<PlatformFile> mastersTranscript = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);
  RxList<PlatformFile> bachelorTranscript = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);
  RxList<PlatformFile> bachelorsDegree = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);
  RxList<PlatformFile> mastersDegree = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);



  RxList<PlatformFile> conformMastersTranscript = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);
  RxList<PlatformFile> conformBachelorTranscript = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);
  RxList<PlatformFile> conformBachelorsDegree = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);
  RxList<PlatformFile> conformMastersDegree = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);




  RxList<PlatformFile> conformMastersTranscript11 = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);
  RxList<PlatformFile> conformBachelorTranscript22 = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);
  RxList<PlatformFile> conformBachelorsDegree33 = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);
  RxList<PlatformFile> conformMastersDegree44 = RxList.filled(
      0, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);



  RxList<PlatformFile> localFile = RxList.filled(
      1, PlatformFile(name: 'controllerFile', size: 0),
      growable: true);


  RxMap<String, dynamic> lorDetails1 = {
    'category_id': '1',
    'recommendersName':'',
    'recommendersDesignation':'',
    'officialEmailId':'',
    'relationWithStudent':'',
  }.obs;

  RxMap<String, dynamic> lorDetails2 = {
    'category_id': '2',
    'recommendersName':'',
    'recommendersDesignation':'',
    'officialEmailId':'',
    'relationWithStudent':'',
  }.obs;

RxInt lorNo = 0.obs;
  List<S2Choice<dynamic>> myList = <S2Choice<dynamic>>[];
  RxList<PlatformFile> toKnowDocs = [
    PlatformFile(name: 'controllerFile', size: 0),
    PlatformFile(name: 'controllerFile', size: 0),
    PlatformFile(name: 'controllerFile', size: 0),
    PlatformFile(name: 'controllerFile', size: 0),
  ].obs;
  // get mapName => null;
  @override
  void onInit() {
    super.onInit();
    debugPrint("print from onit of controller  :-) ");
    // onBoardingQuesApiCall();
  }
  // PlatformFile? localFile;


  RxMap<String, dynamic> personalInformation = {
    'category_id': '1',
    'name': '',
    'last_name': 'dfdf',
    'phone': '',
    // 'country_code': '',
    'alternate_phone': '',
    'email': '',
    'secondary_email': '',
    'gender': 'male',
    'passport_status': '1',
    'passport_number': '',
    'passport_expiry': '',
    'birth_date': '',
    'country_name': '',
    'country_id': '',
    'city_id': '',
    'city_name': '',
  }.obs;

  RxList<RxMap<String, dynamic>> educationDetails =
      RxList.filled(0, growable: true, <String, dynamic>{}.obs);

  RxList<String> highestEducationList = [
    'Education you pursuing in High-school',
    'Class 10th',
    'Class 12th',
    'Diploma',
    'Certification',
    'Bachelors',
    'Masters',
    'Phd',
    'M.Phil',
  ].obs;

  RxMap<String, dynamic> firstEducation = {
    'category_id': '2',
    'qualification': '',
    // 'degree':'',
    'admission_year': '',
    'passing_year': '',
    'stream': '',
    'education_board': '',
    'grade_percentage': '',
    'grade_type': '',
    'medium': '',
  }.obs;
  RxList<dynamic>? user = [].obs;
  RxList<String>? userTitle = [''].obs;

  RxMap<String, dynamic> studyAbroadPref = {
    'category_id': '3',
    'preferred_country': [],
    'preferred_course': [],
    'applied_university_status': '',
    'applied_university_name': '',
    'consultant_name': '',
    'consultant_status': '',
    'intake_years': [],
    'intake_sessions': [],
  }.obs;

  RxMap<String, dynamic> budgetPreference = {
    'category_id': '4',
    'budget': '',
    'fund_source': [],
    'loan_type': '',
  }.obs;

  RxMap<String, dynamic> testStatus = {
    'category_id': '5',
    'english_test': '',
    'english_taken_date': '',
    'english_result_date': '',
    'english_score': '',
    'aptitude_test': '',
    'aptitude_taken_date': '',
    'aptitude_result_date': '',
    'aptitude_score': '',
  }.obs;

  RxBool colleLoan = false.obs;
  RxBool nonColleLoan = true.obs;

  RxBool isTapped = false.obs;
  RxBool isEducationLoan = false.obs;
  RxBool isEmpty = true.obs;
  RxBool showAlert = false.obs;

  List selectedCountries = List.filled(0, '', growable: true);

  List citiesList = [];
  List nationalityList = [];
  List coursesList = [];

  values({String? key, dynamic value, Map? map}) {
    map?[key] = value;
  }

  // void onBoardingQuesApiCall() {
  //   onBoardingQues.getOnBoardQuestions().then(
  //     (response) {
  //       change(
  //         response,
  //         status: RxStatus.success(),
  //       );
  //       debugPrint(
  //           "onBoarding API get call successful from controller proof :--> ${response.message}");
  //       // for (int i = 0; i < (response.cities?.length ?? 1); i++) {
  //       //   citiesList.add(response.cities?[i].name ?? 'Network error');
  //       // }
  //       // for (int i = 0; i < (response.courses?.length ?? 1); i++) {
  //       //   coursesList.add(response.courses?[i].name ?? 'Network error');
  //       // }
  //       // for (int i = 0; i < (response.countries?.length ?? 1); i++) {
  //       //   nationalityList.add(response.countries?[i].name ?? 'Network error');
  //       // }
  //     },
  //     onError: (err) {
  //       change(
  //         null,
  //         status: RxStatus.error(
  //           err.toString(),
  //         ),
  //       );
  //       debugPrint(
  //           "onBoarding API get call failed from controller proof :--> ${err.toString()}");
  //     },
  //   );
  // }
}
