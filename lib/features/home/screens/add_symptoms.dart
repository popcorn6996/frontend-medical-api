// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:real_app/core/commons/custom_button.dart';
// import 'package:real_app/core/commons/custom_textfield.dart';
// import 'package:real_app/core/utils.dart/utils.dart';
// import 'package:real_app/features/home/controller/home_controller.dart';

// class AddSymptomsScreen extends ConsumerStatefulWidget {
//   const AddSymptomsScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _AddSymptomsScreenState();
// }

// class _AddSymptomsScreenState extends ConsumerState<AddSymptomsScreen> {
//   final TextEditingController causeController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();

//   final TextEditingController treatmentController = TextEditingController();

//   final TextEditingController searchParameterContoller =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     addSymptom() {
//       ref.read(homeControllerProvider).addSymptom(
//             nameController.text.trim(),
//             causeController.text.trim(),
//             treatmentController.text.trim(),
//             searchParameterContoller.text.trim(),
//           );
//       //  showSnackBar(context, 'Symptom Added');
//     }

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             vertical: 10,
//             horizontal: 10,
//           ),
//           child: Column(
//             children: [
//               CustomTextField(
//                 hintText: 'Name',
//                 controller: nameController,
//               ),
//               CustomTextField(
//                 hintText: 'Add Cause',
//                 controller: causeController,
//               ),
//               CustomTextField(
//                 hintText: 'Add Treatment',
//                 controller: treatmentController,
//               ),
//               CustomTextField(
//                 hintText: 'Add Search Parameter',
//                 controller: searchParameterContoller,
//               ),
//               CustomButton(onPressed: addSymptom, text: 'Add Symptom'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
