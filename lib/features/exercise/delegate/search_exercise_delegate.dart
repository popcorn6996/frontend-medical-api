import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/exercise_controller.dart';

class SearchExerciseDelegate extends SearchDelegate {
  final WidgetRef ref;
  SearchExerciseDelegate(this.ref);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.close),
      ),
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.send),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return ref.watch(getExerciseProvider(query)).when(
          data: (data) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'The following are your possible illness:',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'You have ${data.exercise.length} results',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 900,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListView.builder(
                        itemCount: data.exercise.length,
                        itemBuilder: (ctx, i) {
                          //   final symptoms = data[i];
                          return Column(
                            children: [
                              const SizedBox(height: 15),
                              Text(
                                'Exercise:  ${data.exercise[i].name}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Type:  ${data.exercise[i].type}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Column(
                                children: data.exercise[i].details
                                    .map((e) => Text(
                                          'Details:  $e',
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ))
                                    .toList(),
                              ),
                              const Divider(
                                thickness: 3,
                                indent: 20,
                                endIndent: 20,
                              ),
                              const SizedBox(height: 15),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            );
          },
          error: (error, trace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
