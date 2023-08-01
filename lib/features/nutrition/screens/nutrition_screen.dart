import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/features/nutrition/controller/nutrition_controller.dart';
import 'package:real_app/features/nutrition/delegate/search_nutrition_delegate.dart';

import '../../../theme/pallete.dart';

class NutritionScreen extends ConsumerStatefulWidget {
  const NutritionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NutritionScreenState();
}

class _NutritionScreenState extends ConsumerState<NutritionScreen> {
  final TextEditingController foodController = TextEditingController();
  // dynamic contentData = NutritionResponse(nutrition: [
  //   Nutrition(name: 'Hello', details: ['Shit'])
  // ]);

  getNutrition() {
    ref
        .read(nutritionControllerProvider)
        .getNutritionDetails(foodController.text);
  }

  // disposeNutrition() {
  //   ref.read(nutritionControllerProvider).disposeNutrition();
  // }

  @override
  void dispose() {
    super.dispose();
    foodController.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getNutrition();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: SearchNutritionDelegate(ref));
              },
              icon: const Icon(IconlyLight.search))
        ],
        title: const Text('Nutrition'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSlideshow(
                  isLoop: true,
                  indicatorBackgroundColor: Pallete.redColor,
                  indicatorColor: Pallete.blueColor,
                  indicatorRadius: 5,
                  //autoPlayInterval: 1,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/food.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/food1.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/food3.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/food4.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Eating a good balanced diet is important, get abreast with all right food to eat at the right time',
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                //   const Text('Search for any foods to get details'),
                const SizedBox(height: 30),
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
                                    AssetImage('assets/images/food.jpeg'),
                              ),
                              Text('Rice')
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
}
