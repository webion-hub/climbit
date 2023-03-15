import 'package:flutter/material.dart';

class LoadingWheel extends StatelessWidget {
  const LoadingWheel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
