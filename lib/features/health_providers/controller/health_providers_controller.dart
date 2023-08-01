// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/features/health_providers/repository/health_providers_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/health_providers_response.dart';

final getHospitalsProvider =
    FutureProvider.family.autoDispose((ref, String location) async {
  final healthProviderController = ref.read(healthControllerProvider);
  return healthProviderController.getHealthProvider(location);
});

final healthProviderStreamProvider = StreamProvider.autoDispose((ref) {
  final healthController = ref.read(healthControllerProvider);
  return healthController.healthProviderStream;
});

final healthControllerProvider = Provider((ref) {
  final healthProvidersController = ref.read(healthRepositoryProvider);
  return HealthProvidersController(
      healthProvidersRepository: healthProvidersController);
});

class HealthProvidersController {
  final HealthProvidersRepository healthProvidersRepository;
  final BehaviorSubject<HealthProvidersResponse> _healthProviderSubject =
      BehaviorSubject<HealthProvidersResponse>();
  HealthProvidersController({
    required this.healthProvidersRepository,
  });

  Future<HealthProvidersResponse> getHealthProvider(String location) async {
    //  HealthProvidersResponse response =
    return await healthProvidersRepository.getHealthProvider(location);
    //  _healthProviderSubject.sink.add(response);
  }

  Stream<HealthProvidersResponse> get healthProviderStream =>
      _healthProviderSubject;

  disposeHealthStream() {
    _healthProviderSubject.close();
  }
}
