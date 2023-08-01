// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/symptoms_details.dart';
import '../../../models/symptoms_details_response.dart';
import '../repository/symptoms_repository.dart';

final symptomsDetailsProvider = FutureProvider.family((ref, String symptom) {
  final symptomController = ref.read(symptomControllerProvider);
  return symptomController.getDetails(symptom);
});

final symptomsStreamsProvider = StreamProvider((ref) {
  final symptomsController = ref.watch(symptomControllerProvider);
  return symptomsController.symptomsStream;
});

final searchSymptomsProvider = StreamProvider.family((ref, String query) {
  final symptomsController = ref.watch(symptomControllerProvider);
  return symptomsController.searchSymptoms(query);
});

// final streamDetails = StreamProvider((ref) {
//   final symptomsController = ref.read(symptomControllerProvider);
//   return symptomsController.getStreamDetails();
// });

final symptomControllerProvider = Provider((ref) {
  final symptomController = ref.read(symptomRepositoryProvider);
  return SymptomsController(symptomsRepository: symptomController);
});

class SymptomsController {
  final SymptomsRepository symptomsRepository;
  final BehaviorSubject<SymptomDetailsResponse> _subject =
      BehaviorSubject<SymptomDetailsResponse>();
  SymptomsController({
    required this.symptomsRepository,
  });

  Future<SymptomDetailsResponse> getDetails(String symptom) {
    return symptomsRepository.getCauseForSymptom(symptom);
    // _subject.sink.add(response);
  }

  Stream<SymptomDetailsResponse> get symptomsStream => _subject;

  disposeStream() {
    _subject.close();
  }

  // Stream<SymptomDetailsResponse> getStreamDetails([String? symptom]) {
  //   return symptomsRepository.getStreamCause(symptom);
  // }

  Stream<List<SymptomsDetails>> searchSymptoms(String query) {
    return symptomsRepository.searchSymptoms(query);
  }

  addSymptom(String name, String cause, String treatment,
      String searchParameter) async {
    return symptomsRepository.addSymptom(
        name, cause, treatment, searchParameter);
  }
}
