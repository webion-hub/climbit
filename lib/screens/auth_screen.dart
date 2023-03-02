import 'package:climbit/screens/forgot_password_screen.dart';
import 'package:climbit/screens/homepage.dart';
import 'package:climbit/screens/signup_screen.dart';
import 'package:climbit/services/auth_service.dart';
import 'package:climbit/utils/utils.dart';
import 'package:climbit/widget/auth/auth_form.dart';
import 'package:climbit/widget/loading/loading_wheel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget/auth/google_login.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  bool _isLoading = false;
  
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future logUserIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await AuthService.logInUser(
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
                const Text('climbit',
                    textAlign: TextAlign.center,
                    textScaleFactor: 5,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                AuthForm(
                  controllerEmail: _emailController,
                  controllerPSW: _passwordController,
                  onPressed: logUserIn,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: const Text(
                          'Password dimenticata?',
                          style: TextStyle(color: Colors.green),
                          ),
                          onTap: () async { Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen()
                            )
                          );
                        }
                      ),
                    ],
                  ),
                ),
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
                          child: Text('O continua con'),
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
                    const Text('Non hai un account?'),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      child: const Text(
                        'Registrati ora',
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      onTap: () async { Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpScreen()
                        ),);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
