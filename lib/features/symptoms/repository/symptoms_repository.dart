// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/models/symptoms_details.dart';
import 'package:real_app/models/symptoms_details_response.dart';

final symptomRepositoryProvider = Provider((ref) {
  return SymptomsRepository();
});

class SymptomsRepository {
  final Dio dio = Dio();

//  Stream<SymptomDetailsResponse> getStreamSymptoms()  {
//      try {
//       final response =  dio.get('http://192.168.43.94:6000/symptoms').asStream();
//       if (response.statusCode == 200) {
//         final data = json.decode(response.data);
//         return  SymptomDetailsResponse.fromJson(data);
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       throw Exception('Failed to load data');
//     }
//  }

  final dataProvider = StreamProvider<SymptomDetailsResponse>((ref) async* {
    final dio = Dio();
    try {
      final response = await dio.get('http://192.168.43.94:6000/symptoms');
      if (response.statusCode == 200) {
        final data = json.decode(response.data);
        yield SymptomDetailsResponse.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  });

  // Stream<SymptomDetailsResponse> getStreamDetails([String? symptom]) {}

  SymptomDetailsResponse? fetchDataFromApiAsStream() {
    // final dio = Dio();

    // Create a StreamedResponse using the Dio.stream method.
    final responseStream =
        dio.getUri(Uri.parse('http://192.168.56.1:6000/symptoms')).asStream();

    // Listen to the stream to process the data.
    responseStream.listen(
      (response) {
        // Process the response data here.
        if (response.statusCode == 200) {
          // Handle successful response here.
          print('Response data: ${response.data}');
          SymptomDetailsResponse.fromJson(response.data);
        } else {
          // Handle error response here.
          print('Error: ${response.statusCode}');
        }
      },
      onError: (error) {
        // Handle errors here (e.g., network errors).
        print('Error: $error');
      },
      cancelOnError: true, // Cancel the stream subscription on error.
    );
    return null;
  }

  Future<SymptomDetailsResponse> getCauseForSymptom(String symptom) async {
    try {
      //  var queryParams = {'name': symptom};
      Map<String, dynamic> headers = {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBvcGNvcm5AcG9wY29ybi5jb20iLCJpZCI6IjY0YmU3NWMyYjgyMmJlYTExM2E1MjJiNiIsImlhdCI6MTY5MDg0NTk4MSwiZXhwIjoxNjkwODU2NzgxfQ.XaNxlVjBN56U-HSambW8Sq6znKgJ8Q-DiCLUcVZhUhg",
        "Cache-Control": "no-cache"
      };
      //final response =
      return dio
          .getUri(
            Uri.parse('http://192.168.56.1:6000/symptoms?name=$symptom'),
            // queryParameters: queryParams,
            options: Options(headers: headers),
          )
          .then((value) => SymptomDetailsResponse.fromJson(value.data));

      // final responseData = response.data;
      //print();

      // if (response.statusCode == 400) {
      //   debugPrint(responseData);
      // } else {
      //   debugPrint(
      //       'Request successful with status code: ${response.statusCode}');
      // }

      // return SymptomDetailsResponse.fromJson(responseData);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Stream<List<SymptomsDetails>> searchSymptoms(String query) {
    // dynamic responseData;
    // List<SymptomDetailsResponse> symptoms = [];
    Map<String, dynamic> headers = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBvcGNvcm5AcG9wY29ybi5jb20iLCJpZCI6IjY0YmU3NWMyYjgyMmJlYTExM2E1MjJiNiIsImlhdCI6MTY5MDQ2NDA3NywiZXhwIjoxNjkwNDc0ODc3fQ.8q4DFSISTye8AV8HBSY9YANJwTra7ehsQH-A8yESPLE",
    };
    return dio
        .get('http://192.168.43.94:6000/symptoms',
            options: Options(headers: headers))
        .asStream()
        .map((event) {
      List<SymptomsDetails> symptoms = [];
      symptoms.add(SymptomsDetails.fromJson(event.data));
      print(symptoms);
      return symptoms;
    });
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
