import 'package:climbit/screens/auth/auth_screen.dart';
import 'package:climbit/screens/page_core.dart';
import 'package:climbit/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'climbit',
      scaffoldMessengerKey: Utils.messangerKey,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return  const PageCore();
            } else {
              return const AuthScreen();
            }
          },
        ),
      ),
    );
  }
}