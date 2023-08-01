import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_app/features/home/screens/home_screen.dart';
import 'package:real_app/features/splash/screens/splash_screen.dart';
import 'package:real_app/theme/pallete.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Real App',
        debugShowCheckedModeBanner: false,
        theme: Pallete.darkmodeAppTheme,
        home: const SplashScreen(),
        routes: {HomeScreen.routeName: (context) => const HomeScreen()});
  }
}
