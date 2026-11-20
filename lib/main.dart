import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const GenshinApp());
}

class GenshinApp extends StatelessWidget {
  const GenshinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Genshin Archive',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF3F5FA),
        colorSchemeSeed: const Color(0xFF526B91),
      ),
      home: const HomePage(),
    );
  }
}