import 'package:flutter/material.dart';

import '../button/button.dart';

class AuthForm extends StatelessWidget {
  final TextEditingController controllerEmail;
  final TextEditingController controllerPSW;
  final Function() onPressed;

  const AuthForm({
    super.key,
    required this.controllerEmail,
    required this.controllerPSW,
    required this.onPressed,
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
                  const SizedBox(height: 12),
                  MainButton(
                    text: 'Login',
                    onPressed: () async {
                      onPressed();
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
