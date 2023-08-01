import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/health_providers_controller.dart';

class SearchHealthProviderDelegate extends SearchDelegate {
  final WidgetRef ref;
  SearchHealthProviderDelegate(this.ref);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
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
    return ref.watch(getHospitalsProvider(query)).when(
          data: (data) {
            return ListView.builder(
                itemCount: data.healthProviders.length,
                itemBuilder: (ctx, i) {
                  return ListTile(
                    title: Text(data.healthProviders[i].name),
                    subtitle: Text(data.healthProviders[i].location),
                  );
                });
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
