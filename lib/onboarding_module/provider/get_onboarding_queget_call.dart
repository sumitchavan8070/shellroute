import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

import '../../Modals/onBoardingDataModel.dart';


class GetOnboardingQuesClass extends GetConnect {
  Future<OnBoardingDataModel> getOnBoardQuestions() async {
    String url = 'https://beta.gradding.com/api/get_onboard';
    String token =
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYmV0YS5ncmFkZGluZy5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2OTE1NTc0NDcsImV4cCI6MjAwNzc4MTQ0NywibmJmIjoxNjkxNTU3NDQ3LCJqdGkiOiJwaG1uSmx0OGZxUXRlbDFqIiwic3ViIjo0OTMsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.gWUpcf-_FofMKY5o9_C8NA0l3ZaHX0uIg7kQ4v5wsKs';
    Map<String, String> header = {'Authorization': token};
    final response = await get(
      url,
      headers: header,
    );

    if (response.hasError) {
      debugPrint(
          "onBoarding API get call failed from provier ${response.statusCode.toString()}");
      debugPrint('pringint data from error ${response.body}');
      return Future.error(response.hasError.toString());
    } else {
      debugPrint('pringint data from provider no getx ${response.statusText}');
      debugPrint(
          "onBoarding API get call successful from provider ${response.statusCode.toString()}");
      return OnBoardingDataModel.fromJson(
        jsonDecode(response.bodyString!),
      );
    }
  }
}
