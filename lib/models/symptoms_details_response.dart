// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:real_app/models/symptoms_details.dart';

class SymptomDetailsResponse {
  final List<SymptomsDetails> symptoms;
  SymptomDetailsResponse({
    required this.symptoms,
  });

  var myMap = {'list': json};

  SymptomDetailsResponse.fromJson(Map<String, dynamic> json)
      : symptoms = (json['foundSymptom'] as List)
            .map((e) => SymptomsDetails.fromJson(e))
            .toList();
}
