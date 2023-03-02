import 'package:flutter/material.dart';

import '../buttons/main_button.dart';

class AuthFormSignUp extends StatelessWidget {
  final TextEditingController controllerEmail;
  final TextEditingController controllerPSW;
  final TextEditingController controllerConfirmPSW;
  final Function() onPressed;

  const AuthFormSignUp({
    super.key,
    required this.controllerEmail,
    required this.controllerPSW,
    required this.onPressed, required this.controllerConfirmPSW,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: const Color.fromARGB(255, 209, 229, 187),
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(labelText: 'Indirizzo email'),
                  ),
                  TextFormField(
                    controller: controllerPSW,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  TextFormField(
                    controller: controllerConfirmPSW,
                    decoration:
                        const InputDecoration(labelText: 'Conferma password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12),
                  MainButton(
                    text: 'Registrati',
                    onPressed: () async {
                      onPressed();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
