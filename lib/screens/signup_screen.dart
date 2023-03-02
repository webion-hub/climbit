import 'package:climbit/screens/auth_screen.dart';
import 'package:climbit/screens/homepage.dart';
import 'package:climbit/services/auth_service.dart';
import 'package:climbit/utils/utils.dart';
import 'package:climbit/widget/auth/auth_form_signup.dart';
import 'package:climbit/widget/auth/google_login.dart';
import 'package:climbit/widget/loading/loading_wheel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _confirmpasswordController = TextEditingController(text: '');
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
  }

  Future signUpUser() async {
    if (_passwordController.text == _confirmpasswordController.text) {
      setState(() {
        _isLoading = true;
      });
      try {
        await AuthService.signUserIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ).then(
          (value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          ),
        );
      } on FirebaseAuthException catch (err) {
        Utils.showSnackBar(err.message);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      Utils.showSnackBar('Le password non corrispondono');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: _isLoading ? const LoadingWheel() : SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.landscape_rounded,
                  color: Colors.black45,
                  size: 100.0,
                ),
                const Text('Registrati ora!',
                    textAlign: TextAlign.center,
                    textScaleFactor: 4,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                AuthFormSignUp(
                    controllerEmail: _emailController,
                    controllerPSW: _passwordController,
                    controllerConfirmPSW: _confirmpasswordController,
                    onPressed: () async {
                      signUpUser();
                    }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('O registrati con'),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const GoogleLogin(),
                const SizedBox(height: 70),
                Row(
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
                          fontWeight: FontWeight.bold),
                      ),
                      onTap: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AuthScreen()),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
