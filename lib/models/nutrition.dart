// ignore_for_file: public_member_api_docs, sort_constructors_first
class Nutrition {
  final String name;
  final List<dynamic> details;
  Nutrition({
    required this.name,
    required this.details,
  });

  Nutrition.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        details = json['details'];
}
