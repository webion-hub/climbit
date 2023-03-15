import 'package:flutter/material.dart';

class SeparatorWithoutText extends StatelessWidget {
  const SeparatorWithoutText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          children: const [
            Expanded(
              child: Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
