import 'package:flutter/material.dart';

class QuickActionCard extends StatelessWidget {
  final String title;
  const QuickActionCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.amber.withValues(alpha: 0.3)),
      ),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, color: Colors.amber, fontWeight: FontWeight.bold),
      ),
    );
  }
}
