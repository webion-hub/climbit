import 'package:climbit/widget/saved/gym_card.dart';
import 'package:flutter/material.dart';


class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palestre salvate'),
      ),
      body: Column(
        children: const [
          SizedBox(height: 20),
          GymCard(),
        ],
      ),
    );
  }
}