import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const NEXOLiveApp());
}

class NEXOLiveApp extends StatelessWidget {
  const NEXOLiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEXO Live',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F172A),
          elevation: 0,
        ),
      ),
      home: const MainScreen(),
    );
  }
}