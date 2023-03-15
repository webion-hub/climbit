import 'package:climbit/models/gym_model.dart';
import 'package:flutter/material.dart';

class GymHours extends StatelessWidget {
  final GymModel gym;

  const GymHours({
    super.key,
    required this.gym,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 7; i++)
            Text(
              textAlign: TextAlign.start,
              '${gym.hours[i].day}: ${gym.hours[i].time}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
        ],
      ),
    );
  }
}