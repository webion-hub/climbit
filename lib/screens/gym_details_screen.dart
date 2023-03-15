import 'package:climbit/models/gym_model.dart';
import 'package:climbit/widget/gyms/gym_carousel.dart';
import 'package:climbit/widget/gyms/gym_changes.dart';
import 'package:climbit/widget/gyms/gym_hours.dart';
import 'package:climbit/widget/gyms/gym_warning_card.dart';
import 'package:climbit/widget/gyms/separator_without_text.dart';
import 'package:flutter/material.dart';
import '../widget/gyms/gym_graph.dart';

class GymDetailsScreen extends StatefulWidget {
  final GymModel gym;
  
  const GymDetailsScreen({
    super.key, required this.gym,
  });

  

  @override
  State<GymDetailsScreen> createState() => _GymDetailsScreenState();
}

class _GymDetailsScreenState extends State<GymDetailsScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.gym.id,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: SizedBox(
                  height: screenHeight / 3.5,
                  width: screenWidth,
                  child: Image.asset(
                    'assets/images/Test.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: 20,
              ),
              child: Text(
                widget.gym.name,
                style: Theme.of(context).textTheme.headlineLarge
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: 0,
              ),
              child: widget.gym.open ?
                const Text(
                  'Aperta',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                  ),
                ) 
              : const Text(
                'Chiusa',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                ),
              ),  
            ),
            widget.gym.competition ?
              const GymWarningCard()
            : 

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: 10,
              ),
              child: Text(
                'Indirizzo: ${widget.gym.address}',
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
              ),
            ),
            const SeparatorWithoutText(),
            GymHours(gym: widget.gym),
            const SeparatorWithoutText(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: 10,
              ),
              child: Text(
                widget.gym.info,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
              ),
            ),
            const SeparatorWithoutText(),
            const GymCarousel(),
            const SeparatorWithoutText(),
            GymChanges(gym: widget.gym),
            const SeparatorWithoutText(),
            const GymChart(),
          ],
        ),
      ),
    );
  }
}