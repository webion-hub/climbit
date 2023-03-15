import 'package:flutter/material.dart';

class GymWarningCard extends StatelessWidget {
  const GymWarningCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.shade50,
      margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            const Text(
              'In questa palestra è in corso una competizione',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.warning_amber_rounded,
              size: 40,
              color: Colors.red.shade700,
            ),
          ],
        ),
      ),
    );
  }
}