// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:real_app/models/nutrition.dart';

class NutritionResponse {
  final List<Nutrition> nutrition;
  NutritionResponse({
    required this.nutrition,
  });

  NutritionResponse.fromJson(Map<String, dynamic> json)
      : nutrition = (json['fetchednutrition'] as List)
            .map((e) => Nutrition.fromJson(e))
            .toList();
}
