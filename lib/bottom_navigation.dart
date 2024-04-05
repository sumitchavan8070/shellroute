import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/Components/Drawer/drawer_menu.dart';
import 'package:testinggetx/routes/go_path.dart';
import 'Controller/getx_main_controller.dart';
import 'constants/app_colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, this.child,});
  final Widget? child;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // int selectedItem = 0;
  // static final List<Widget> _pages = <Widget>[
  //   TabBarExample(key: UniqueKey(),),
  //   Explore(key: UniqueKey(),),
  //   HomePage(key: UniqueKey(),),
  //   UniFinder(key: UniqueKey(),),
  //   // PorfilePage(key: UniqueKey(),)
  //   LoginDetails(key: UniqueKey(),)
  //   // TransactionHistory(key: UniqueKey(),)
  //   // UnpaidApplications(key: UniqueKey(),)
  //   // ApplicationManager(),
  // ];
  // bool shouldShowAppBarAndBottomBar = true;
  //
  // @override
  // void initState() {
  //   super.initState();
  // }
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Check for the current route here, which runs after initState
  //   _onRouteChanged();
  // }
  //
  // void _onRouteChanged() {
  //   final currentRoute = ModalRoute.of(context)?.settings.name;
  //   // Check if the current route is one of the defined routes
  //   final isDefinedRoute = [
  //     GoPath.login,
  //     GoPath.congratulationScreen,
  //     GoPath.tabBarDocs,
  //     GoPath.explore,
  //     GoPath.homePage,
  //     GoPath.unifinder,
  //     GoPath.chat,
  //   ].contains(currentRoute);
  //
  //   // Update the state to show/hide the app bar and bottom bar
  //   setState(() {
  //     shouldShowAppBarAndBottomBar = isDefinedRoute;
  //   });
  // }
  //
  //
  //

  bool keyboardOpen = false;
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    final controller = Get.put(GetXMainController());
    return Scaffold(
      backgroundColor: AppColors.white,
      key: controller.scaffoldKeyDrawer,
      floatingActionButton: keyboardIsOpen
          ? const SizedBox()
          : Container(
        height: 66,width: 65,
        decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  offset: const Offset(0, 1),
                  spreadRadius: 2,
                  blurRadius: 5
              )
            ]
        ),
        child: InkWell(
          onTap: () {
            _onItemTapped(2, context);
          },
          child: Center(
            child: SvgPicture.asset("assets/images/consultancy.svg", height: 30,width: 30,),
          ),
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:  Obx(
        () => BottomNavigationBar(
          key: controller.bottomNavigationBarKey,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: CupertinoColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.black,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: controller.selectedIndex.toInt(), //New
          onTap: (int idx) => _onItemTapped(idx, context),
          items: [
            BottomNavigationBarItem(
              label: 'Call Now',
              icon: SvgPicture.asset("assets/images/call-now.svg").paddingOnly(bottom: 5),
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              icon: SvgPicture.asset("assets/images/explore.svg").paddingOnly(bottom: 5),
            ),
            BottomNavigationBarItem(
              label: 'Consultancy',
              icon: SvgPicture.asset("assets/images/consultancy.svg").paddingOnly(top: 1.5),
            ),
            BottomNavigationBarItem(
              label: 'Unifinder',
              icon: SvgPicture.asset("assets/images/unifinder.svg").paddingOnly(bottom: 5),
            ),
            BottomNavigationBarItem(
              label: 'Live Chat',
              icon: SvgPicture.asset("assets/images/chat.svg").paddingOnly(bottom: 5),
            ),
          ],
        ),
      ),
      // body: Obx( () => _pages[controller.selectedIndex.toInt()]),
      body: widget.child,
      drawer: const DrawerMenu(),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(GoPath.tabBarDocs);
        break;
      case 1:
        context.go(GoPath.explore);
        break;
      case 2:
        context.go(GoPath.homePage);
        break;
      case 3:
        context.go(GoPath.unifinder);
        break;
      case 4:
        context.go(GoPath.chat);
        break;
      default:
        context.go(GoPath.homePage);
    }
  }

}
