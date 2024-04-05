  import 'dart:convert';
  import 'package:dio/dio.dart';
  import 'package:flutter/foundation.dart';
  import 'package:get/get.dart';
  import '../Modals/get_user_modal.dart';


class ApiController extends GetxController {
    final dio = Dio();
    GetUserModal? getUserModal;
    var isLoading = true.obs;

    @override
    Future<void> onInit() async {
      getUser(3);
      super.onInit();
    }
//
    getUser(int id) async {
      var res = await dio.get("https://reqres.in/api/users/$id");
      if(res.statusCode == 200){
        isLoading(false);
        var body = jsonDecode(res.toString());
        getUserModal = GetUserModal.fromJson(body);
      }
      else{
        isLoading(true);
        if (kDebugMode) {
          print(res.statusCode.toString());
        }
      }
    }
//
//
//   }


}