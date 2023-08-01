// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/features/nutrition/repository/nutrition_repository.dart';

import '../../../models/nutrition_response.dart';

final getNutritionProvider = FutureProvider.family((ref, String name) async {
  final nutritionController = ref.read(nutritionControllerProvider);
  return nutritionController.getNutritionDetails(name);
});

// final streamNutritionProvider = StreamProvider((ref) {
//   final nutritionController = ref.read(nutritionControllerProvider);
//   return nutritionController.nutritionStream;
// });

final nutritionControllerProvider = Provider((ref) {
  final nutritionRepository = ref.read(nutritionRepositoryProvider);
  return NutritionController(nutritionRepository: nutritionRepository);
});

class NutritionController {
  final NutritionRepository nutritionRepository;
  // final BehaviorSubject<NutritionResponse> _nutritionSubject =
  //     BehaviorSubject<NutritionResponse>();
  NutritionController({
    required this.nutritionRepository,
  });

  Future<NutritionResponse> getNutritionDetails(String name) async {
    return await nutritionRepository.getNutrition(name);
    // _nutritionSubject.sink.add(response);
  }

  // Stream<NutritionResponse> get nutritionStream => _nutritionSubject;

  // disposeNutrition() {
  //   _nutritionSubject.close();
  // }
}
