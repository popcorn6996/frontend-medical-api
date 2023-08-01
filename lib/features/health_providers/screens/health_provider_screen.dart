import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/core/commons/custom_textfield.dart';
import 'package:real_app/features/health_providers/controller/health_providers_controller.dart';
import 'package:real_app/features/health_providers/delegate/search_health_providers_delegate.dart';

class HealthProviderScreen extends ConsumerStatefulWidget {
  const HealthProviderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HealthProviderScreenState();
}

class _HealthProviderScreenState extends ConsumerState<HealthProviderScreen> {
  final TextEditingController locationContoller = TextEditingController();

  disposeHealthProvider() {
    ref.read(healthControllerProvider).disposeHealthStream();
  }

  @override
  dispose() {
    super.dispose();
    locationContoller.dispose();
    disposeHealthProvider();
  }

  getHospital() {
    ref
        .read(healthControllerProvider)
        .getHealthProvider(locationContoller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchHealthProviderDelegate(ref));
            },
            icon: const Icon(IconlyLight.search),
          ),
        ],
        title: const Text('Health Clinics'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/location 1.png',
                  height: 350,
                ),
                const Text(
                  'Need a Hospital? No Stress search to find one near you asap',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                // CustomTextField(
                //   hintText: 'Enter your nearby Location...',
                //   controller: locationContoller,
                // ),
                const SizedBox(height: 15),
                // CustomButton(onPressed: getHospital, text: 'Search'),
                // const SizedBox(height: 15),
                // ref.read(healthProviderStreamProvider).when(data: (data) {
                //   return SizedBox(
                //     height: 300,
                //     child: ListView.builder(
                //         itemCount: data.healthProviders.length,
                //         itemBuilder: (context, i) {
                //           return Text(
                //               '${data.healthProviders[i].name} ----- ${data.healthProviders[i].location}');
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
      ),
    );
  }
}
