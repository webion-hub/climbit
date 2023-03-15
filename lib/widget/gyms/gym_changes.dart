import 'package:climbit/models/gym_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GymChanges extends StatelessWidget {
  final GymModel gym;
  const GymChanges({
    super.key,
    required this.gym,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = gym.lastchange;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Percorsi aggiornati il ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
            DateFormat("dd/MM/yyyy").format(now),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Icon(
              Icons.circle_notifications,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
