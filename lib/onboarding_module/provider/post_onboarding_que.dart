import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _getConnect = GetConnect();
String token =
'eyJpdiI6InRYSWVNYmVrQVE4ZkwvbVZqWUFhS0E9PSIsInZhbHVlIjoiTjFxdHIxQ2Z1K3JIekNSbkJxWGpDTGYvY0ZZaE1pNkZ1amgyUE1jL3dDc0poSHJRMXIyVEo1TDVCTE0rMFQzMFpEcWxlSEkwSGQvL0UzakxFd2xGaU1CZ1ZGN2M5L29TUTd4NWZaZW5wT1QyMEJ0bkpSeDZFR1d4SEQ5Ynlya2xhUjFCUGhyb1NXOHd2bFFlbFZ5Vy9aL0hqaTZjcWVYZWpYaGNuVFFzMElxQ3d5bjZOMnZYTCtsVTZMVUluOW1ScW00dGpldnVjcEJmblF4V3AreHYvNkVZMHplQU5WTXRaY1E5d1FobjlDL0dnWWx5bzVQb0NXNHdKY0VFTmxVWnJhSU5xRVMwR05obWVOUWd6YWNNa2V4L0xqUm8vRWIzOFlUS2tEU2JBY0R4dnNPc2VYWExlUUEzM0JlU1RlNzdlM1VtZ0R0WGlzZWRYNGhDK003emtLSTNTNkpYKzZKR3dRM04vVzV6OHY4ai9nZVAyTVJWVmFibmNzalQ0TG5oVTlHNFFZRmQvc1ZYWnpmd2YxR2YzemVTVXNmK0dweW96MXM5T2t1TkZPSTV0VnE4NDIwTEE5R1lsNVdoRFNod0luelIzUk9JSllrQno4VHMxTk9uUGc9PSIsIm1hYyI6ImZlNDZjMzhlNjg3Nzk4ZWZkNDY4NWU2Y2Q2NDA1MTE1YmUzNmYxMGI5YjI0ZjFiNzhhODdkOTE5NDMxNWI5ZDMiLCJ0YWciOiIifQ==';
class PostOnboardingQuesClass extends GetConnect {
  final Map<String, String> _mainHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };


  onBoardingQuesApiPost({
    required String? endpoint,
    required Map<String, dynamic> postData,
  }) async {
    String? baseURl = 'https://beta.gradding.com/api';
    String? url = baseURl + endpoint!;

    try {
      var postResponse =
          await _getConnect.post(url, postData, headers: _mainHeaders);
      if (postResponse.hasError) {
        debugPrint(postResponse.statusText);
      }
      // print(postResponse.body);
      debugPrint('post post ${postResponse.body}');

      return postResponse.body;


    } catch (e) {
      debugPrint('print from the catch of posting data it means ERORRRRRRRR!!');
      debugPrint('${Response(statusText: e.toString())}');
      return const Response(statusCode: 0);
    }
  }
}
