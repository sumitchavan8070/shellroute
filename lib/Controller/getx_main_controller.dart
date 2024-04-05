import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/classes.dart';

class GetXMainController extends GetxController{

  RxString isLoggedIn = 'Login'.obs;
  RxString onboardOver = 'onboard'.obs;

  // RxBool onboardOver = false.obs;

  RxString phoneNumberError = 'Enter Number'.obs;

  void validatePhone({required String? number}){
    if (number == null || number.isEmpty) {
      phoneNumberError.value =  'Phone number is required';
    }
    else if (number.length != 10) {
      phoneNumberError.value =  'Invalid Phone Number';
    }
    else if(number.length == 10){
      phoneNumberError.value =  '';
    }
  }



  List recentsarch = [].obs;
  void addsearch (String data){
    recentsarch.add(data);
  }

  RxInt start = 30.obs;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    start.value = 30;
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    start.value = 30;
    timer.cancel();
  }



  RxList<dynamic>? user = [].obs;
  RxList<String>? userTitle = [''].obs;

  // RxString applicationStatus = "".obs;

  List<String> suggestions = ['Afghanistan', 'Albania', 'Algeria', 'Australia', 'Brazil', 'German', 'Madagascar', 'Mozambique', 'Portugal', 'Zambia'];
  RxList selectedCountry = [].obs;
  RxList tempCountry = [].obs;

  List<String> course = ['B.com','B.Tech','B.Sc','B.Ed','BCA',];
  List courses = [].obs;
  List tempCourses = [].obs;


  final selectedIndex = 2.obs;
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }


  final GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();
  final GlobalKey bottomNavigationBarKey = GlobalKey();


  void openDrawer() {
    scaffoldKeyDrawer.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKeyDrawer.currentState?.closeDrawer();
  }

  List<Feature> profileTabbar = [
    Feature(name: "Personal Information", svg: "assets/images/personalInformation.svg"),
    Feature(name: "Educational Details", svg: "assets/images/educatioalDetails.svg"),
    Feature(name: "Study Abroad Preferences", svg: "assets/images/studyAbroadPreferences.svg"),
    Feature(name: "Budget Preferences", svg: "assets/images/budgetPreferences.svg"),
    Feature(name: "Test Status", svg: "assets/images/testStatus.svg"),
    Feature(name: "Documents ", svg: "assets/images/Documents.svg"),
  ];

  List profileDetails = [
    ProfileDetails(svg: "assets/images/name.svg", data: "Divya Jain", title: "Name"),
    ProfileDetails(svg: "assets/images/number.svg", data: "+91 1524852369", title: "Number"),
    ProfileDetails(svg: "assets/images/number.svg", data: "--", title: "Alternative Number"),
    ProfileDetails(svg: "assets/images/email.svg", data: "divya.j@gmail.com", title: "Email"),
    ProfileDetails(svg: "assets/images/email.svg", data: "--", title: "Alternative Email"),
    ProfileDetails(svg: "assets/images/dob.svg", data: "1997-09-13", title: "Date of Birth"),
    ProfileDetails(svg: "assets/images/gender.svg", data: "Female", title: "Gender"),
    ProfileDetails(svg: "assets/images/passportNumber.svg", data: "--", title: "Passport Number"),
    ProfileDetails(svg: "assets/images/doe.svg", data: "--", title: "Date of Expiration"),
    ProfileDetails(svg: "assets/images/country.svg", data: "United Kingdom", title: "Country"),
    ProfileDetails(svg: "assets/images/state.svg", data: "London", title: "State"),
    ProfileDetails(svg: "assets/images/city.svg", data: "Newport", title: "City"),
    ProfileDetails(svg: "assets/images/VisaRefusal.svg", data: "No", title: "Visa Refusal"),
  ];
  
  List transactionHistory = [
    Transaction(date: "25 March 2023", purpose: "Application Fees ", amount: "1000", success: true),
    Transaction(date: "22 March 2023", purpose: "Webinar Fees ", amount: "500", success: true),
    Transaction(date: "22 March 2023", purpose: "Webinar Fees ", amount: "500", success: false),
  ];
  

  List<Feature> features = [
    Feature(name: "Live Events and Webinar", svg: "assets/images/Drawer/live.svg"),
    Feature(name: "University Deadline", svg: "assets/images/Drawer/deadline.svg"),
    Feature(name: "Exam Prep", svg: "assets/images/Drawer/exam-prep.svg"),
    Feature(name: "Countries", svg: "assets/images/Drawer/countries.svg"),
    Feature(name: "Accomodation", svg: "assets/images/Drawer/accomodation.svg"),
    Feature(name: "Scholarship", svg: "assets/images/Drawer/scholarship.svg"),
  ];
  
  

  List<Feature> resources = [
    Feature(name: "Blog", svg: "assets/images/Drawer/blog.svg"),
    Feature(name: "FAQ's", svg: "assets/images/Drawer/faq.svg"),
    Feature(name: "Help Center", svg: "assets/images/Drawer/help-center.svg"),
  ];

  List<Feature> users = [
    Feature(name: "Applications", svg: "assets/images/Drawer/applications.svg"),
    Feature(name:"Documents", svg: "assets/images/Drawer/documents.svg"),
    Feature(name:"Finances", svg: "assets/images/Drawer/finances.svg"),
    Feature(name:"Unifinder", svg: "assets/images/Drawer/unifinder.svg"),
  ];

  List<Feature> tablist = [
    Feature(name: "98%", svg: "assets/images/tablist1.svg", subtitle: 'Visa Success Rate'),
    Feature(name:"15 Million+", svg: "assets/images/tablist2.svg", subtitle: 'Scholarships Achieved'),
    Feature(name:"15,000+", svg: "assets/images/tablist3.svg", subtitle: 'Successful Global Students'),
    Feature(name:"+15 Years", svg: "assets/images/tablist4.svg", subtitle: 'Counselling Experience'),
  ];

  List<Feature> cardlist = [
    Feature(name: "", svg: "assets/images/ielts.svg"),
    Feature(name:"", svg: "assets/images/gmat.svg"),
    Feature(name:"", svg: "assets/images/pte.svg"),
    Feature(name:"", svg: "assets/images/toefl.svg"),
  ];

  List<Feature> explore = [
    Feature(name: "UK", svg: "assets/images/uk.svg"),
    Feature(name:"Canada", svg: "assets/images/canada.svg"),
    Feature(name:"USA", svg: "assets/images/usa.svg"),
    Feature(name:"Australia", svg: "assets/images/aus.svg"),
  ];

  List<Feature> unpaidApplicationList = [
    Feature(name: "Pre-sessional English 9 weeks", svg: "Middlesex University"),
    Feature(name:"Pre-Master’s for Business, Hospitality, Tourism and Social Science (3 Terms)", svg: "(KAPLAN) University of Brighton"),
  ];


  List trending = [
    'Upcoming Exams',
    'MBA Colleges',
    'Best University for abroad',
    'Best University',
    ];
  List unpaidApplication = [
    '‘One’ application, ‘multiple’ courses & universities',
    '700+ Global University Tie Ups',
    'High Values Scholarships & Study Loans',
    'Supporting you all the way',
  ];

  List feeRange = [
    '0-10k',
    '0-20k',
    '0-30k',
    '0-40k',
    '40k+',
  ];

  List applicationManager = [
    "WATCHLISTED",
    "SHORTLISTED",
    "APPLIED",
    "RESULTS",
  ];



  List shortlist= [].obs;
  List watchlist= [].obs;
  List applied= [].obs;
  List result= [].obs;

  void addshortlist(String name,String subject){
    shortlist.add(Shorlisted(name: name, subject: subject));
  }
  void addwatchlist(String name,String subject){
    watchlist.add(Shorlisted(name: name, subject: subject));
  }
  void addapplied(String name,String subject){
    applied.add(Shorlisted(name: name, subject: subject));
  }
  void addfinal(String name,String subject){
    result.add(Shorlisted(name: name, subject: subject));
  }




  List<Data> data  = [
    Data(
      title: "webinar UK Abroad Abroad Abroad Abroad Abroad Abroad Abroad Abroad Abroad",
      date: "August 26th", time: '4:00 PM - 5:00 PM'
    ),
    Data(
      title: "webinar UK Abroad",
      date: "August 27th", time: '5:00 PM - 6:00 PM'
    ),
  ];





  /// /////////////////////////////////////////HOME PAGE TABS DOCUMENT UPLOAD DATA /////////////////////////////////////////////////////////////////////////
  RxBool isLoading = false.obs;
  RxBool isSelected = false.obs;

  values({String? key, dynamic value, Map? map}) {
    map?[key] = value;
  }

  RxList<PlatformFile> localFile = RxList.filled(
      1,
      PlatformFile(
        name: 'controllerFile',
        size: 0
      ),
      growable: true
    );

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

  RxList<PlatformFile> gettingToKnowYou = [
    PlatformFile(name: 'Resume', size: 0, ),
    PlatformFile(name: 'LOR1', size: 0),
    PlatformFile(name: 'LOR2', size: 0),
    PlatformFile(name: 'SOP', size: 0),
  ].obs;

  RxList<PlatformFile> degree = [
    PlatformFile(name: 'Bachelor’s Degree Transcripts', size: 0),
    PlatformFile(name: 'Master’s Degree Transcripts', size: 0),
    PlatformFile(name: 'Bachelor’s Degree', size: 0),
    PlatformFile(name: 'Master’s Degree', size: 0),
  ].obs;

  RxList<PlatformFile> highSchoolDocs = [
    PlatformFile(name: 'Class 10 Marksheet', size: 0),
    PlatformFile(name: 'Class 12 Marksheet', size: 0)
  ].obs;

  RxList<PlatformFile> aptitude = [
    PlatformFile(name: 'GRE Scores', size: 0),
    PlatformFile(name: 'GMAT Scores', size: 0)
  ].obs;

  RxList<PlatformFile> englishProficiency = [
    PlatformFile(name: 'IELTS Scorecard', size: 0),
    PlatformFile(name: 'TOEFL Scorecard', size: 0),
    PlatformFile(name: 'Duolingo Scorecard', size: 0),
    PlatformFile(name: 'PTE Scorecard', size: 0)
  ].obs;

  RxList<PlatformFile> professionalExperience = [
    PlatformFile(name: 'Work Experience Letters', size: 0),
    PlatformFile(name: 'Internship Letters', size: 0)
  ].obs;

  RxList<PlatformFile> personalInformation = [
    PlatformFile(name: 'Passport', size: 0),
    PlatformFile(name: 'Aadhaar Card', size: 0)
  ].obs;

  RxList<PlatformFile> others = [
    PlatformFile(name: 'No Backlogs Certificate', size: 0),
  ].obs;

  RxList<PlatformFile> visa = [
    PlatformFile(name: 'VISA SOP/Cover Letter', size: 0),
    PlatformFile(name: 'I-20 Letter', size: 0),
    PlatformFile(name: 'Letter of Acceptance', size: 0),
    PlatformFile(name: 'Admission/Offer Letters', size: 0),
    PlatformFile(name: 'VISA Form', size: 0),
    PlatformFile(name: 'DS-160 Confirmation', size: 0),
  ].obs;

  RxList<PlatformFile> financial = [
    PlatformFile(name: 'Pan Card', size: 0),
    PlatformFile(name: 'Affidavit of Support', size: 0),
    PlatformFile(name: 'Bank Statement', size: 0),
    PlatformFile(name: 'Loan Sanction Letter', size: 0),
    PlatformFile(name: 'Asset Declaration', size: 0),
    PlatformFile(name: 'Income Tax Returns', size: 0),
  ].obs;

  RxList<PlatformFile> additional = [
    PlatformFile(name: "", size: 0)
  ].obs;











}

