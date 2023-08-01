import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SymptomsDetails {
  final dynamic name;
  final List<dynamic> cause;
  final List<dynamic> treatment;
  SymptomsDetails({
    required this.name,
    required this.cause,
    required this.treatment,
  });

  var myMap = {'list': json};

  SymptomsDetails.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        cause = json['cause'],
        treatment = json['treatment'];
}
