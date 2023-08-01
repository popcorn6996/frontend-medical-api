// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:real_app/models/exercise.dart';

class ExerciseResponse {
  final List<Exercise> exercise;
  ExerciseResponse({
    required this.exercise,
  });

  ExerciseResponse.fromJson(Map<String, dynamic> json)
      : exercise = (json['fetchedExercise'] as List)
            .map((e) => Exercise.fromJson(e))
            .toList();
}
