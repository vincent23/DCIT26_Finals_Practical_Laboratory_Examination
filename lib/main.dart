
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CampusCompanionApp());
}

class CampusCompanionApp extends StatelessWidget {
  const CampusCompanionApp({super.key});

  static const Color primaryGreen = Color(0xFF1E5E3A);
  static const Color lightGreen = Color(0xFFE8F2EC);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Companion',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryGreen,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
