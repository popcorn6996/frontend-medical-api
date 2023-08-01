// ignore_for_file: public_member_api_docs, sort_constructors_first
class Exercise {
  final String name;
  final String type;
  final List<dynamic> details;
  Exercise({
    required this.name,
    required this.type,
    required this.details,
  });

  Exercise.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        type = json['type'],
        details = json['details'];
}
