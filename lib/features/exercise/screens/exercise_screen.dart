import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/core/commons/custom_button.dart';
import 'package:real_app/core/commons/custom_textfield.dart';
import 'package:real_app/features/exercise/controller/exercise_controller.dart';
import 'package:real_app/features/exercise/delegate/search_exercise_delegate.dart';

import '../../../theme/pallete.dart';

class ExerciseScreen extends ConsumerStatefulWidget {
  const ExerciseScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends ConsumerState<ExerciseScreen> {
  final TextEditingController exerciseController = TextEditingController();

  getExercise() {
    ref.read(exerciseControllerProvider).getExercise(exerciseController.text);
  }

  // disposeExercise() {
  //   ref.read(exerciseControllerProvider).diposeStream();
  // }

  @override
  void dispose() {
    super.dispose();
    exerciseController.dispose();
    //disposeExercise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
                showSearch(
                  context: context,
                  delegate: SearchExerciseDelegate(ref),
                );
              },
              icon: const Icon(IconlyLight.search))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/exercise.png',
                height: 350,
              ),
              const Text(
                'Exercise is Important, Do it regularly to stay in shape.',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 180,
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
                                  AssetImage('assets/images/exercise3.png'),
                            ),
                            Text('CardioVascular')
                          ],
                        ),
                      );
                    }),
              ),
              // CustomTextField(
              //   hintText: 'Search Exercise',
              //   controller: exerciseController,
              // ),
              const SizedBox(height: 10),
              // CustomButton(onPressed: getExercise, text: 'Search Exercise...'),
              // ref.read(exerciseStreamProvider).when(data: (data) {
              //   return SizedBox(
              //     height: 300,
              //     child: ListView.builder(
              //         itemCount: data.exercise.length,
              //         itemBuilder: (ctx, i) {
              //           return Text(
              //               '${data.exercise[i].name} -- ${data.exercise[i].type} -- ${data.exercise[i].details}');
              //         }),
              //   );
              // }, error: (error, trace) {
              //   return Center(
              //     child: Text(error.toString()),
              //   );
              // }, loading: () {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // })
            ],
          ),
        ),
      ),
    );
  }
}
