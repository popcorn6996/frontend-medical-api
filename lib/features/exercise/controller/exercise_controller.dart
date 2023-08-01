// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/features/exercise/repository/exercise_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/exercise_reponse.dart';

final exerciseStreamProvider = StreamProvider.family((ref, String exercise) {
  final exerciseController = ref.read(exerciseControllerProvider);
  return exerciseController.streamExerciseDetails(exercise);
});

final getExerciseProvider = FutureProvider.family((ref, String exercise) async {
  final exerciseController = ref.read(exerciseControllerProvider);
  return exerciseController.getExercise(exercise);
});

final exerciseControllerProvider = Provider((ref) {
  final exerciseRepository = ref.read(exerciseRepositoryProvider);
  return ExerciseController(exerciseRepository: exerciseRepository);
});

class ExerciseController {
  final ExerciseRepository exerciseRepository;
  final BehaviorSubject<ExerciseResponse> _exerciseSubject =
      BehaviorSubject<ExerciseResponse>();
  ExerciseController({
    required this.exerciseRepository,
  });

  Future<ExerciseResponse> getExercise(String exercise) async {
    return await exerciseRepository.getExercise(exercise);
    //_exerciseSubject.sink.add(response);
  }

  Stream<List<ExerciseResponse>> streamExerciseDetails(String exercise) {
    return exerciseRepository.streamExerciseDetails(exercise);
  }

  Stream<ExerciseResponse> get exerciseStream => _exerciseSubject;

  diposeStream() {
    _exerciseSubject.close();
  }
}
