import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Components/Explore/search_container.dart';
import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/explore.dart';
import 'package:testinggetx/profile.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'package:testinggetx/unifinder.dart';
import 'package:testinggetx/upload_documents_module/components/additional_docs/details.dart';
import 'package:testinggetx/upload_documents_module/components/additional_docs/upload_other.dart';
import 'package:testinggetx/upload_documents_module/components/additional_docs/upload_other_confirmtion.dart';
import 'package:testinggetx/upload_documents_module/components/lor/lor_details.dart';
import 'package:testinggetx/upload_documents_module/components/lor/lor_upload_page.dart';
import 'package:testinggetx/upload_documents_module/components/upload_confirmation.dart';
import 'package:testinggetx/upload_documents_module/components/upload_multiple_files.dart';
import 'package:testinggetx/upload_documents_module/components/lor/view_lor_details.dart';
import 'package:testinggetx/upload_documents_module/view/tabbar.dart';
import '../Components/home_page/add_application.dart';
import '../Components/login_details.dart';
import '../home_page.dart';
import '../bottom_navigation.dart';
import '../login_module/view/verification_otp.dart';
import '../login_module/view/create_password.dart';
import '../login_module/view/login.dart';
import '../login_module/view/password_success.dart';
import '../login_module/view/reset_password.dart';
import '../login_module/view/signup.dart';
import '../login_module/view/welcoming.dart';
import '../custom_stepper.dart';
import '../onboarding_module/view/congratulation_screen.dart';
import '../upload_documents_module/components/lor/lor_confirmation.dart';
import '../upload_documents_module/components/upload_page_firts_part.dart';


final controller = Get.put(GetXMainController());
final GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navigator');


  final GoRouter goRouter = GoRouter(
    // redirect: (context, state) async {
    //   var sharedPref = await SharedPreferences.getInstance();
    //   var isLoggedIn = sharedPref.getBool(controller.isLoggedIn.value);
    //
    //   if (isLoggedIn != null) {
    //     if (isLoggedIn) {
    //       context.go(GoPath.tabBarDocs);
    //     } else {
    //       context.go(GoPath.login);
    //     }
    //   } else {
    //     context.go(GoPath.login);
    //   }
    //   return null;
    // },

    navigatorKey: navigatorKey,
    // initialLocation:GoPath.login,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          debugPrint("hihteish ${GoRouterState.of(context).matchedLocation}");
          return BottomNavigation(child: child);
        },
        routes: [
          GoRoute(
              path: GoPath.tabBarDocs,
              name: GoPath.tabBarDocs,
              parentNavigatorKey: shellNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const TabBarExample();
              }),
          GoRoute(
              path: GoPath.explore,
              name: GoPath.explore,
              parentNavigatorKey: shellNavigatorKey,

              builder: (BuildContext context, GoRouterState state) {
                return const Explore();
              }),
          GoRoute(
              path: GoPath.homePage,
              name: GoPath.homePage,
              parentNavigatorKey: shellNavigatorKey,

              builder: (BuildContext context, GoRouterState state) {
                return const HomePage();
              }),
          GoRoute(
              path: GoPath.unifinder,
              name: GoPath.unifinder,
              parentNavigatorKey: shellNavigatorKey,

              builder: (BuildContext context, GoRouterState state) {
                return const UniFinder();
              }),
          GoRoute(
              path: GoPath.chat,
              name: GoPath.chat,
              parentNavigatorKey: shellNavigatorKey,

              builder: (BuildContext context, GoRouterState state) {
                return const LoginDetails();
              }),

        ]
      ),

      GoRoute(
          path: GoPath.profile,
          name: GoPath.profile,
          parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const Profile();
          }),
      GoRoute(
          path: GoPath.login,
          name: GoPath.login,
          // parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const Login();
          }),
      GoRoute(
          path: GoPath.welcome,
          name: GoPath.welcome,
          // parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const WelcomeOnboard();
          }),
      GoRoute(
        name: '/customStepper',
        path: '/customStepper',
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          return const CustomStepper();
        },
      ),
      GoRoute(
        name: GoPath.congratulationScreen,
        path: GoPath.congratulationScreen,
        // parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          return const CongratulationScreen();
        },
      ),
      GoRoute(
          path: GoPath.forgotPassword,
          name: GoPath.forgotPassword,
          // parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const ResetPassword();
          }),
      GoRoute(
          path: GoPath.sendOtp(number: 'number'),
          name: GoPath.otp,
          // parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            final number = state.pathParameters['number']!;
            return OTP(number: number);
          }),
      GoRoute(
          path: GoPath.createPassword,
          name: GoPath.createPassword,
          // parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const CreatePassword();
          }),
      GoRoute(
          path: GoPath.successPassword,
          name: GoPath.successPassword,
          // parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const PasswordSuccess();
          }),
      GoRoute(
          path: GoPath.signup,
          name: GoPath.signup,
          // parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUp();
          }),
      // GoRoute(
      //     path: GoPath.bottomBar,
      //     name: GoPath.bottomBar,
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const BottomNavigation(showBottomNavigationBar: true,);
      //     }),
      // GoRoute(
      //     path: GoPath.homePage,
      //     name: GoPath.homePage,
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const HomePage();
      //     }),
      // GoRoute(
      //     path: GoPath.profile,
      //     name: GoPath.profile,
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const Profile();
      //     }),
      GoRoute(
          path: GoPath.addApplication(title: 'title'),
          name: GoPath.application,
          parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            final title = state.pathParameters['title']!;
            return AddApplication(
              title: title,
            );
          }),
      GoRoute(
        path: GoPath.editApplication(
            title: 'title', name: 'name', course: 'course'),
        name: GoPath.editapplication,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          return AddApplication(
            title: state.pathParameters['title'],
            name: state.pathParameters['name'],
            course: state.pathParameters['course'],
          );
        },
      ),
      GoRoute(
        path: GoPath.uploadPageFirstPartWithData(
            index: 'index', title1: 'title1', title2: 'title2'),
        name: GoPath.uploadPageFirstPart,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          RxList<PlatformFile> list = state.extra as RxList<PlatformFile>;
          return UploadPageFirstPart(
            mapName: list,
            title1: state.pathParameters['title1'],
            title2: state.pathParameters['title2'],
            index: state.pathParameters['index'],
          );
        },
      ),
      GoRoute(
          path: GoPath.uploadConfirmationWithData(
              index: 'index', title1: 'title1', title2: 'title2'),
          name: GoPath.uploadConfirmation,
          parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            final index = state.pathParameters['index']!;
            final title1 = state.pathParameters['title1']!;
            final title2 = state.pathParameters['title2']!;
            List<PlatformFile> list = state.extra as List<PlatformFile>;
            return UploadConfirmation(
              index: index,
              title1: title1,
              title2: title2,
              mapName: list,
            );
          }),
      GoRoute(
        path: GoPath.uploadMultipleWithData(
            index: 'index', title1: 'title1', title2: 'title2'),
        name: GoPath.uploadMultiple,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          RxList<PlatformFile> list = state.extra as RxList<PlatformFile>;
          return UploadMultiple(
            mapName: list,
            title1: state.pathParameters['title1'],
            title2: state.pathParameters['title2'],
            index: state.pathParameters['index'],
          );
        },
      ),
      GoRoute(
        path: GoPath.lorDetailsWithData(
            index: 'index', title1: 'title1', title2: 'title2'),
        name: GoPath.lorDetails,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          RxList<PlatformFile> list = state.extra as RxList<PlatformFile>;
          return LORDetails(
            mapName: list,
            title1: state.pathParameters['title1'],
            title2: state.pathParameters['title2'],
            index: state.pathParameters['index'],
          );
        },
      ),
      GoRoute(
        path: GoPath.lorUploadWithData(
            index: 'index', title1: 'title1', title2: 'title2'),
        name: GoPath.lorUpload,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          RxList<PlatformFile> list = state.extra as RxList<PlatformFile>;
          return LORUploadPage(
            mapName: list,
            title1: state.pathParameters['title1'],
            title2: state.pathParameters['title2'],
            index: state.pathParameters['index'],
          );
        },
      ),
      GoRoute(
        path: GoPath.lorConfirmationWithData(
            index: 'index', title1: 'title1', title2: 'title2'),
        name: GoPath.lorConfirmation,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          RxList<PlatformFile> list = state.extra as RxList<PlatformFile>;
          return LORConfirmation(
            mapName: list,
            title1: state.pathParameters['title1'],
            title2: state.pathParameters['title2'],
            index: state.pathParameters['index'],
          );
        },
      ),
      GoRoute(
          path: GoPath.viewLorDetailsTitle(title: 'title'),
          name: GoPath.viewLorDetails,
          parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return ViewLorDetails(
              title: state.pathParameters['title'],
            );
          }),
      GoRoute(
          path: GoPath.docName,
          name: GoPath.docName,
          parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const DocumentName();
          }),
      GoRoute(
          path: GoPath.uploadOtherWithData(name: 'name'),
          name: GoPath.uploadOther,
          parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return UploadOther(title: state.pathParameters['name']);
          }),
      GoRoute(
        path: GoPath.uploadOtherConfirmationWithData(
            title: 'title', title2: 'title2'),
        name: GoPath.uploadOtherConfirmation,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          RxList<PlatformFile> list = state.extra as RxList<PlatformFile>;
          return UploadOtherConfirmation(
            mapName: list,
            title: state.pathParameters['title'],
            title2: state.pathParameters['title2'],
          );
        },
      ),
      GoRoute(
          path: GoPath.searchCountry,
          name: GoPath.searchCountry,
          parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const SearchCountry();
          }),
      GoRoute(
          path: GoPath.searchCourse,
          name: GoPath.searchCourse,
          parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const SearchCourse();
          }),
      // GoRoute(
      //     path: GoPath.explore,
      //     name: GoPath.explore,
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const Explore();
      //     }),
    ],
  );


