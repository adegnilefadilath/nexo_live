import 'package:flutter/material.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      child: const Center(
        child: Text(
          'Écran Trending - Tendances du moment',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}