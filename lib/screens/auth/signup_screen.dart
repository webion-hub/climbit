import 'package:climbit/screens/page_core.dart';
import 'package:climbit/services/auth_service.dart';
import 'package:climbit/services/user_service.dart';
import 'package:climbit/utils/constants.dart';
import 'package:climbit/utils/utils.dart';
import 'package:climbit/widget/auth/auth_form_signup.dart';
import 'package:climbit/widget/auth/bottom_auth_text.dart';
import 'package:climbit/widget/auth/google_login.dart';
import 'package:climbit/widget/auth/separator_with_text.dart';
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
  final _usernameController = TextEditingController(text: '');
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _usernameController.dispose();
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
          username: _usernameController.text.trim(),
        ).then((value) {
          UserService.addUserDetails(
              email: _emailController.text.trim(),
              username: _usernameController.text.trim(),
              id: Utils.currentUid(), photoUrl: Constants.userImageDefault);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const PageCore(),
          ));
        });
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
          child: _isLoading
              ? const LoadingWheel()
              : SingleChildScrollView(
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
                          controllerUsername: _usernameController,
                          onPressed: () async {
                            await signUpUser();
                          }),

                      const SeparatorWithText(text: 'O registrati con'),
                      const GoogleLogin(),
                      const SizedBox(height: 70),
                      const BottomAuthText(auth: false),                      
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
