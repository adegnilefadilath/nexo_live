import 'package:flutter/material.dart';

class CountriesSection extends StatelessWidget {
  const CountriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> countries = [
      {'name': 'Saudi Arabia', 'emoji': '🇸🇦', 'users': '45.2K'},
      {'name': 'USA', 'emoji': '🇺🇸', 'users': '120.5K'},
      {'name': 'India', 'emoji': '🇮🇳', 'users': '89.7K'},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Countries & Regions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return GestureDetector(
                  onTap: () {
                    // Action quand on clique sur un pays
                  },
                  child: Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF334155)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          country['emoji']!,
                          style: const TextStyle(fontSize: 32),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          country['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${country['users']} users',
                          style: TextStyle(color: Colors.grey[400], fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}