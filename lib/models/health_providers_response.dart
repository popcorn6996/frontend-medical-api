import 'package:real_app/models/health_providers.dart';

class HealthProvidersResponse {
  final List<HealthProviders> healthProviders;

  HealthProvidersResponse({required this.healthProviders});

  HealthProvidersResponse.fromJson(Map<String, dynamic> json)
      : healthProviders = (json['fetchedHospitals'] as List)
            .map((e) => HealthProviders.fromJson(e))
            .toList();
}
