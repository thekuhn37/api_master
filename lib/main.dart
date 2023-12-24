import 'package:api_practice/screens/home_screen.dart';
import 'package:api_practice/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  ApiService().getPopMovies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
