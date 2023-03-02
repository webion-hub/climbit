import 'package:flutter/material.dart';

class LoadingWheel extends StatelessWidget {
  const LoadingWheel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
