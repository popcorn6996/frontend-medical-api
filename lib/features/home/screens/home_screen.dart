import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/features/symptoms/screens/symptoms_screen.dart';
import 'package:real_app/theme/pallete.dart';

import '../../exercise/screens/exercise_screen.dart';
import '../../health_providers/screens/health_provider_screen.dart';
import '../../nutrition/screens/nutrition_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = '/homeScreen';
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Widget> screens = [
    const SymptomsScreen(),
    const Center(child: Text('To be filled')),
    const NutritionScreen(),
    const ExerciseScreen(),
    const HealthProviderScreen(),
  ];
  int page = 0;
  onTap(int index) {
    setState(() {
      page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[page],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Pallete.whiteColor,
        onTap: onTap,
        currentIndex: page,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              IconlyLight.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyLight.editSquare,
            ),
            label: 'Heart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.self_improvement,
            ),
            label: 'Heart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyLight.heart,
            ),
            label: 'Heart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyLight.editSquare,
            ),
            label: 'Heart',
          ),
        ],
      ),
    );
  }
}
