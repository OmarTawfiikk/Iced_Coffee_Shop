import 'package:flutter/material.dart';
import 'home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Ice Coffee',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // set white background
      ),
      home: HomeView(),
    );
  }
}
