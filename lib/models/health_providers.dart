class HealthProviders {
  final String name;
  final String location;
  HealthProviders({required this.location, required this.name});

  HealthProviders.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        location = json['location'];
}
