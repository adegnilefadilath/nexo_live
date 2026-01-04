import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      child: const Center(
        child: Text(
          'Écran Explore - Découvrez du contenu',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}