import 'package:climbit/screens/auth/auth_screen.dart';
import 'package:climbit/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';

class BottomAuthText extends StatelessWidget {
  final bool auth;

  const BottomAuthText({
    super.key, 
    required this.auth
  });

  @override
  Widget build(BuildContext context) {
    if(auth) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Non hai un account?'),
          const SizedBox(
            width: 4,
          ),
          GestureDetector(
            child: const Text(
              'Registrati',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () async {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              );
            },
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Hai già un account?'),
          const SizedBox(
            width: 4,
          ),
          GestureDetector(
            child: const Text(
              'Effettua il login',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () async {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AuthScreen()),
              );
            },
          ),
        ],
      );
    }
  }
}
