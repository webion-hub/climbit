import 'package:climbit/utils/utils.dart';
import 'package:climbit/widget/buttons/main_button.dart';
import 'package:climbit/widget/loading/loading_wheel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
  }

  final _emailcontroller = TextEditingController(text: '');

  Future resetPassword() async {
    const LoadingWheel();
    try {
      var nav = Navigator.of(context);
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailcontroller.text.trim());
      Utils.showSnackBar('Email di recupero password inviata');

      nav.pop();
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password dimenticata'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Ricevi un\'e-mail per reimpostare la password'),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailcontroller,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 20),
              MainButton(
                text: 'Resetta Password',
                onPressed: resetPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
