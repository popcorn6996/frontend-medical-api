import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/models/nutrition_response.dart';

final nutritionRepositoryProvider = Provider((ref) {
  return NutritionRepository();
});

class NutritionRepository {
  final Dio dio = Dio();

  Future<NutritionResponse> getNutrition(String name) async {
    try {
      var queryParams = {'name': name};
      Map<String, dynamic> headers = {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBvcGNvcm5AcG9wY29ybi5jb20iLCJpZCI6IjY0YmU3NWMyYjgyMmJlYTExM2E1MjJiNiIsImlhdCI6MTY5MDg0NTk4MSwiZXhwIjoxNjkwODU2NzgxfQ.XaNxlVjBN56U-HSambW8Sq6znKgJ8Q-DiCLUcVZhUhg",
      };
      final response = await dio.get('http://192.168.56.1:6000/nutritions',
          queryParameters: queryParams, options: Options(headers: headers));

      final responseData = response.data;

      if (response.statusCode == 400) {
        print(responseData);
      } else {
        print(responseData);
        print('Request successful with status code: ${response.statusCode}');
      }

      return NutritionResponse.fromJson(responseData);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
