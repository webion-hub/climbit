import 'package:climbit/screens/auth/auth_screen.dart';
import 'package:climbit/screens/profile/profile_screen.dart';
import 'package:climbit/screens/saved_screen.dart';
import 'package:climbit/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const SavedScreen(),
    ProfileScreen(profileId: Utils.currentUid()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        
        appBar: AppBar(
          title: const Text('climbit'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ));
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
