// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/models/symptoms_details_response.dart';

final homeRepositoryProvider = Provider((ref) {
  return HomeRepository();
});

class HomeRepository {
  final Dio dio = Dio();

  // Stream<SymptomDetailsResponse> getStreamCause([String? symptom]) {
  //   var queryParams = {'name': symptom};
  //   return dio
  //       .get('http://192.168.43.94:6000/symptoms',
  //           queryParameters: queryParams,
  //           options: Options(responseType: ResponseType.stream))
  //       .asStream()
  //       .map((response) {
  //     print(response.data);
  //     return SymptomDetailsResponse.fromJson(response.data);
  // //   });

  //   // final List<dynamic> responseData = jsonDecode(response.data);
  //   // final realData = responseData[0];

  //   // final responseData = response.data;

  //   // print(responseData);

  //   // return SymptomDetailsResponse.fromJson(responseData);
  // }

  Future<SymptomDetailsResponse> getCauseForSymptom(String symptom) async {
    try {
      var queryParams = {'name': symptom};
      Map<String, dynamic> headers = {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBvcGNvcm5AcG9wY29ybi5jb20iLCJpZCI6IjY0YmU3NWMyYjgyMmJlYTExM2E1MjJiNiIsImlhdCI6MTY5MDg0NTk4MSwiZXhwIjoxNjkwODU2NzgxfQ.XaNxlVjBN56U-HSambW8Sq6znKgJ8Q-DiCLUcVZhUhg",
      };
      final response = await dio.get('http://192.168.43.94:6000/symptoms',
          queryParameters: queryParams, options: Options(headers: headers));

      final responseData = response.data;

      if (response.statusCode == 400) {
        print(responseData);
      } else {
        print(responseData);
        print('Request successful with status code: ${response.statusCode}');
      }

      return SymptomDetailsResponse.fromJson(responseData);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  addSymptom(
    String name,
    String cause,
    String treatment,
    String searchParameter,
  ) async {
    Map<String, dynamic> data = {
      'name': name,
      "cause": [cause],
      'treatment': [treatment],
      "searchParameter": [searchParameter]
    };
    Response response =
        await dio.post('https://192.168.43.94:6000/symptoms', data: data);
    debugPrint(response.data);
  }
}
