import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/features/symptoms/controller/symptoms_controller.dart';

class SearchSymptomDelegate extends SearchDelegate {
  final WidgetRef ref;
  final VoidCallback onPressed;
  SearchSymptomDelegate(this.ref, this.onPressed);
  @override
  List<Widget>? buildActions(BuildContext context) {
    showRAndSetState() {
      showResults(context);
      onPressed;
    }

    return [
      IconButton(onPressed: showRAndSetState, icon: const Icon(Icons.send)),
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return ref.watch(symptomsDetailsProvider(query)).when(
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
                  'You have ${data.symptoms.length} results',
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
                      itemCount: data.symptoms.length,
                      itemBuilder: (ctx, i) {
                        //   final symptoms = data[i];
                        return Column(
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              'Possible ailment:  ${data.symptoms[i].name}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Column(
                              children: data.symptoms[i].cause
                                  .map(
                                    (e) => Text(
                                      'Causes:  $e',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 5),
                            Column(
                              children: data.symptoms[i].treatment
                                  .map((e) => Text(
                                        'Treatment:  $e',
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
        error: (error, trace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () => const Center(
              // child: Text('Fetching Data....'),
              child: CircularProgressIndicator(),
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
