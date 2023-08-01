import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/nutrition_controller.dart';

class SearchNutritionDelegate extends SearchDelegate {
  final WidgetRef ref;
  SearchNutritionDelegate(this.ref);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(IconlyLight.closeSquare),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ref.watch(getNutritionProvider(query)).when(
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
                    'You have ${data.nutrition.length} results',
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
                        itemCount: data.nutrition.length,
                        itemBuilder: (ctx, i) {
                          //   final symptoms = data[i];
                          return Column(
                            children: [
                              const SizedBox(height: 15),
                              Text(
                                'Diet:  ${data.nutrition[i].name}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Column(
                                children: data.nutrition[i].details
                                    .map(
                                      (e) => Text(
                                        'Details:  $e',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(height: 5),
                              // Column(
                              //   children: data.nutrition[i].treatment
                              //       .map((e) => Text(
                              //             'Treatment:  $e',
                              //             style: const TextStyle(
                              //               fontSize: 16,
                              //             ),
                              //             textAlign: TextAlign.center,
                              //           ))
                              //       .toList(),
                              // ),
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
