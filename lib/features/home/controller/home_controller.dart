// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:real_app/features/home/repository/home_repository.dart';

// import '../../../models/symptoms_details.dart';
// import '../../../models/symptoms_details_response.dart';

// final symptomsDetailsProvider =
//     FutureProvider.family.autoDispose((ref, String symptoms) async {
//   final homeController = ref.read(homeControllerProvider);
//   return homeController.getDetails(symptoms);
// });

// // final streamDetails = StreamProvider((ref) {
// //   final homeController = ref.read(homeControllerProvider);
// //   return homeController.getStreamDetails();
// // });

// final homeControllerProvider = Provider((ref) {
//   final homeController = ref.read(homeRepositoryProvider);
//   return HomeController(homeRepository: homeController);
// });

// class HomeController {
//   final HomeRepository homeRepository;
//   HomeController({
//     required this.homeRepository,
//   });

//   Future<SymptomDetailsResponse> getDetails(String symptom) {
//     return homeRepository.getCauseForSymptom(symptom);
//   }

//   // Stream<SymptomDetailsResponse> getStreamDetails([String? symptom]) {
//   //   return homeRepository.getStreamCause(symptom);
//   // }

//   addSymptom(String name, String cause, String treatment,
//       String searchParameter) async {
//     return homeRepository.addSymptom(name, cause, treatment, searchParameter);
//   }
// }
