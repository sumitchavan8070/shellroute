import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXTabController extends GetxController with GetTickerProviderStateMixin{
  late TabController tabcontroller;
  late TabController tabcardcontroller;

  int index = 0;
  @override
  void onInit() {
    tabcontroller = TabController(vsync: this, length: 5);
    tabcardcontroller = TabController(vsync: this, length: 4);
    super.onInit();
  }

}