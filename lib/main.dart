  // ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
  import 'package:flutter_native_splash/flutter_native_splash.dart';
  import 'package:get/get.dart';
  import 'package:page_transition/page_transition.dart';
  import 'package:shared_preferences/shared_preferences.dart';
  import 'package:testinggetx/Controller/getx_main_controller.dart';
import 'package:testinggetx/routes/go_path.dart';
  import 'package:testinggetx/routes/go_routes.dart';

  import 'constants/app_colors.dart';
  import 'onboarding_module/controller/getx_controller.dart';

  void main() {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    runApp(MyApp());
    FlutterNativeSplash.remove();
    routing();

  }

  void routing() async{
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(controller.isLoggedIn.value);

    if (isLoggedIn != null) {
      if (isLoggedIn) {
        goRouter.go(GoPath.homePage);
      } else {
        goRouter.go(GoPath.login);
      }
    } else {
      goRouter.go(GoPath.login);
    }
    return null;
  }


  class MyApp extends StatelessWidget {
    MyApp({super.key});
    GetController getMainController = Get.put(GetController());
    final controller =  Get.put(GetXMainController());


    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // darkTheme: ThemeData(brightness: Brightness.dark),
        // themeMode: ThemeMode.system,
        theme: ThemeData(
          // brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          primarySwatch: Colors.blue,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              // TargetPlatform.iOS: PageTransition(type: PageTransitionType.fade, child: this).matchingBuilder,
              TargetPlatform.android: PageTransition(type: PageTransitionType.rightToLeft, child: this).matchingBuilder,
            }
          ),
          textTheme: const TextTheme(
              labelSmall: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Hebbo',
              ),
              bodySmall: TextStyle(
                color: AppColors.subtitle,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Hebbo',
              ),
              bodyMedium: TextStyle(
                color: AppColors.title,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Hebbo',
              ),
              headlineMedium: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Hebbo',
              ),
              displaySmall: TextStyle(
                color: AppColors.bg,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                fontFamily: 'Hebbo',
              )),
          inputDecorationTheme: const InputDecorationTheme(
              contentPadding: EdgeInsets.only(top: 0.0, bottom: 7),
              isDense: true,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              floatingLabelStyle: TextStyle(
                color: AppColors.subtitle,
                fontSize: 13,
              ),
              labelStyle: TextStyle(
                  color: AppColors.palceholder,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'Heebo'),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.border,
                  width: 1,
                ),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 1),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.shadow,
                  width: 1,
                ),
              ),
            ),
          fontFamily: "Roboto"
        ),
        routerConfig: goRouter,
        // routerDelegate: goRouter.routerDelegate,
        // backButtonDispatcher: goRouter.backButtonDispatcher

      );
    }
}


