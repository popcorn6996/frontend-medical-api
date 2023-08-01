import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/features/symptoms/widgets/preview_symptom.dart';
import 'package:real_app/theme/pallete.dart';

import '../controller/symptoms_controller.dart';
import '../delegate/search_symptom_delegate.dart';

// class TestSymptomsScreen extends ConsumerWidget {
//   const TestSymptomsScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Symptoms',
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 showSearch(
//                   context: context,
//                   delegate: SearchSymptomDelegate(ref),
//                 );
//               },
//               icon: const Icon(IconlyLight.search))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 15,
//               vertical: 20,
//             ),
//             child: Column(
//               children: [
//                 Image.asset(
//                   'assets/images/doctor2.png',
//                   height: 200,
//                 ),
//                 const Text(
//                   'Get access to 1000s of probable diseases by a single search of a symptom',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     // letterSpacing: 1.2,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//                 //   const Text('Search a Symptoms to assisted'),
//                 const SizedBox(height: 15),
//                 Container(
//                   height: 200,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 5,
//                       itemBuilder: (ctx, i) {
//                         return Container(
//                           height: 100,
//                           width: 120,
//                           margin: const EdgeInsets.symmetric(horizontal: 10.0),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(
//                                 color: Pallete.whiteColor,
//                                 width: 2,
//                               )),
//                           child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(15),
//                                     topRight: Radius.circular(15),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/malaria.jpeg',
//                                   ),
//                                 ),
//                                 const Text('Malaria'),
//                               ]),
//                         );
//                       }),
//                 )
//                 // CustomTextField(
//                 //   controller: symptomsController,
//                 //   hintText: 'Search Symptom...',
//                 // ),
//                 // const SizedBox(height: 10),
//                 // CustomButton(
//                 //   text: isLoading ? 'Loading' : "Get Cause",
//                 //   onPressed: () => getSymptomsDetails(symptomsController.text),
//                 // ),
//                 // ref.watch(symptomsStreamsProvider).when(data: (data) {
//                 //   return SizedBox(
//                 //     height: 450,
//                 //     child: ListView.builder(
//                 //         itemCount: data.symptoms.length,
//                 //         itemBuilder: (ctx, i) {
//                 //           return Column(
//                 //             children: [
//                 //               Text(data.symptoms[i].name),
//                 //               SizedBox(
//                 //                 height: 80,
//                 //                 child: ListView.builder(
//                 //                   itemCount: data.symptoms[i].cause.length,
//                 //                   itemBuilder: (ctx, i) {
//                 //                     return Text(
//                 //                       data.symptoms[i].cause[0],
//                 //                     );
//                 //                   },
//                 //                   // child: Text(
//                 //                   //   data.symptoms[i].name,
//                 //                   // ),
//                 //                 ),
//                 //               ),
//                 //             ],
//                 //           );
//                 //         }),
//                 //   );
//                 // }, error: (err, trace) {
//                 //   return Center(
//                 //     child: Text(err.toString()),
//                 //   );
//                 // }, loading: () {
//                 //   return const Center(
//                 //     child: Text('Symptoms Results will show here'),
//                 //   );
//                 // })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class SymptomsScreen extends ConsumerStatefulWidget {
  const SymptomsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends ConsumerState<SymptomsScreen> {
  final TextEditingController symptomsController = TextEditingController();
  var isLoading = false;

  @override
  void dispose() {
    super.dispose();
    symptomsController.dispose();
  }

  onPressed() {
    setState(() {});
  }

  // getSymptomsDetails(String symptoms) {
  //   ref.read(symptomControllerProvider).getDetails(symptoms);
  // }

  // disposeStream() {
  //   ref.read(symptomControllerProvider).disposeStream();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   ref.read(symptomControllerProvider).getDetails(symptomsController.text);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Symptoms',
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchSymptomDelegate(ref, onPressed),
                );
              },
              icon: const Icon(IconlyLight.search))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/doctor2.png',
                  height: 300,
                ),
                const Text(
                  'Get access to tons of probable diseases by a single search of a symptom',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                //   const Text('Search a Symptoms to assisted'),
                const SizedBox(height: 25),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (ctx, i) {
                        return Container(
                          height: 150,
                          width: 150,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Pallete.whiteColor,
                              width: 1,
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage('assets/images/malaria.jpeg'),
                              ),
                              Text('Malaria')
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // CustomTextField(
  //   controller: symptomsController,
  //   hintText: 'Search Symptom...',
  // ),
  // const SizedBox(height: 10),
  // CustomButton(
  //   text: isLoading ? 'Loading' : "Get Cause",
  //   onPressed: () => getSymptomsDetails(symptomsController.text),
  // ),
  // ref.watch(symptomsStreamsProvider).when(data: (data) {
  //   return SizedBox(
  //     height: 450,
  //     child: ListView.builder(
  //         itemCount: data.symptoms.length,
  //         itemBuilder: (ctx, i) {
  //           return Column(
  //             children: [
  //               Text(data.symptoms[i].name),
  //               SizedBox(
  //                 height: 80,
  //                 child: ListView.builder(
  //                   itemCount: data.symptoms[i].cause.length,
  //                   itemBuilder: (ctx, i) {
  //                     return Text(
  //                       data.symptoms[i].cause[0],
  //                     );
  //                   },
  //                   // child: Text(
  //                   //   data.symptoms[i].name,
  //                   // ),
  //                 ),
  //               ),
  //             ],
  //           );
  //         }),
  //   );
  // }, error: (err, trace) {
  //   return Center(
  //     child: Text(err.toString()),
  //   );
  // }, loading: () {
  //   return const Center(
  //     child: Text('Symptoms Results will show here'),
  //   );
  // })
}
