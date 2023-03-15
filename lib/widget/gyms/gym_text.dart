import 'package:flutter/material.dart';

class GymText extends StatelessWidget {
  final String text;
  const GymText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    );
  }
}
