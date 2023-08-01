import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/models/exercise_reponse.dart';

final exerciseRepositoryProvider = Provider((ref) {
  return ExerciseRepository();
});

class ExerciseRepository {
  final Dio dio = Dio();

  Stream<List<ExerciseResponse>> streamExerciseDetails(String exercise) {
    Map<String, dynamic> headers = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBvcGNvcm5AcG9wY29ybi5jb20iLCJpZCI6IjY0YmU3NWMyYjgyMmJlYTExM2E1MjJiNiIsImlhdCI6MTY5MDg0NTk4MSwiZXhwIjoxNjkwODU2NzgxfQ.XaNxlVjBN56U-HSambW8Sq6znKgJ8Q-DiCLUcVZhUhg",
    };
    return dio
        .get('http://192.168.43.94:6000/exercise',
            options: Options(headers: headers))
        .asStream()
        .map((event) {
      List<ExerciseResponse> exercise = [];
      exercise.add(ExerciseResponse.fromJson(event.data));
      print(exercise);
      return exercise;
    });
  }

  Future<ExerciseResponse> getExercise(String exercise) async {
    try {
      var queryParams = {'name': exercise};
      Map<String, dynamic> headers = {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBvcGNvcm5AcG9wY29ybi5jb20iLCJpZCI6IjY0YmU3NWMyYjgyMmJlYTExM2E1MjJiNiIsImlhdCI6MTY5MDU0Mzk2MCwiZXhwIjoxNjkwNTU0NzYwfQ.uXSqceziBs2oMfYU5H5MNDd3pjRsUYHKmgs1ilSBmG4",
      };
      final response = await dio.get('http://192.168.43.94:6000/exercise',
          queryParameters: queryParams, options: Options(headers: headers));

      final responseData = response.data;

      if (response.statusCode == 400) {
        print(responseData);
      } else {
        print(responseData);
        print('Request successful with status code: ${response.statusCode}');
      }

      return ExerciseResponse.fromJson(responseData);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
