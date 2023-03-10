import 'package:flutter/material.dart';

import '../../services/google_auth.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightGreen),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset('assets/images/google-logo.png', height: 40),
            ),
          ],
        ),
        onTap: () async {
          GoogleAuth.signInWithGoogle(context);
        }
      );
  }
}
