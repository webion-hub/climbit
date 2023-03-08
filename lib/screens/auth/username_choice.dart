import 'package:climbit/screens/homepage.dart';
import 'package:climbit/services/google_auth.dart';
import 'package:climbit/widget/buttons/main_button.dart';
import 'package:flutter/material.dart';

class UsernameChoice extends StatefulWidget {
  const UsernameChoice({super.key});
  
  
  
  @override
  State<UsernameChoice> createState() => _UsernameChoiceState();
}

class _UsernameChoiceState extends State<UsernameChoice> {

  final TextEditingController usernamecontroller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Inserire uno username',
                textAlign: TextAlign.center,
                textScaleFactor: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 209, 229, 187),
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextFormField(
                              controller: usernamecontroller,
                              keyboardType: TextInputType.name,
                              decoration:
                                  const InputDecoration(labelText: 'Username'),
                            ),
                            const SizedBox(height: 25),
                            MainButton(
                              text: 'Continua',
                              onPressed: () async {
                                GoogleAuth.createNewUserWithGoogle(
                                    usernamecontroller.text);
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              },
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}