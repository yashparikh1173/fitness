import 'package:flutter/material.dart';
import 'home_page.dart';  // Import your HomePage
import 'profile_page.dart';  // Import your ProfilePage

void main() {
  runApp(FitnessApp());
}

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Dark Theme
      home: HomePage(),
    );
  }
}
