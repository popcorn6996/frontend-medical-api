// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../core/commons/custom_button.dart';
// import '../../../core/commons/custom_textfield.dart';
// import '../../../models/symptoms_details_response.dart';
// import '../controller/home_controller.dart';

// class Home extends ConsumerStatefulWidget {
//   const Home({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
// }

// class _HomeState extends ConsumerState<Home> {
//   final TextEditingController symptomsController = TextEditingController();
//   var isLoading = false;

//   @override
//   void dispose() {
//     super.dispose();
//     symptomsController.dispose();
//   }

//   // Future<SymptomDetailsResponse>?
//   getSymptomsDetails() {
//     ref.read(homeControllerProvider).getDetails(
//           symptomsController.text.trim(),
//         );
//   }

//   // Stream<SymptomDetailsResponse> getStreamSymptomsDetails() {
//   //   return ref.read(homeControllerProvider).getStreamDetails(
//   //         symptomsController.text.trim(),
//   //       );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 15,
//               vertical: 20,
//             ),
//             child: Column(
//               children: [
//                 const Text(
//                   'Medical Information all at one place',
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1.2,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 Image.asset(
//                   'assets/images/doctor2.png',
//                   height: 200,
//                 ),
//                 // const SizedBox(height: 20),
//                 const Text('Search a Symptoms to assisted'),
//                 const SizedBox(height: 15),
//                 CustomTextField(
//                   controller: symptomsController,
//                   hintText: 'Search Symptom...',
//                 ),
//                 const SizedBox(height: 10),
//                 CustomButton(
//                   text: isLoading ? 'Loading' : "Get Cause",
//                   onPressed: () {
//                     setState(() {
//                       isLoading = true;
//                     });
//                     getSymptomsDetails();
//                     setState(() {
//                       isLoading = false;
//                     });
//                     print('it came');
//                   },
//                 ),
//                 ref
//                     .watch(symptomsDetailsProvider(symptomsController.text))
//                     .when(data: (data) {
//                   return Container(
//                     height: 450,
//                     child: ListView.builder(
//                         itemCount: data.symptoms.length,
//                         itemBuilder: (ctx, i) {
//                           return Column(
//                             children: [
//                               Text(data.symptoms[i].name),
//                               SizedBox(
//                                 height: 80,
//                                 child: ListView.builder(
//                                   itemCount: data.symptoms[i].cause.length,
//                                   itemBuilder: (ctx, i) {
//                                     return Text(
//                                       data.symptoms[i].cause.first,
//                                     );
//                                   },
//                                   // child: Text(
//                                   //   data.symptoms[i].name,
//                                   // ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         }),
//                   );
//                 }, error: (err, trace) {
//                   return Center(
//                     child: Text(err.toString()),
//                   );
//                 }, loading: () {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
