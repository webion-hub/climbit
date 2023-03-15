import 'package:climbit/screens/auth/username_choice_screen.dart';
import 'package:climbit/screens/homepage.dart';
import 'package:climbit/services/user_service.dart';
import 'package:climbit/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


late String email;
late String id;

class GoogleAuth {
  static Future signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(gUser.id);
    final doc = await userDocRef.get();
    final StatefulWidget page;

    email = gUser.email;
    id = gUser.id;

    if (doc.exists) {
      page = const HomePage();
    } else {
      page = const UsernameChoiceScreen();
    }
    return FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => page)));
  }

  static Future createNewUserWithGoogle(String username) async {
    UserService.addUserDetails(email: email, username: username, id: id, photoUrl: Constants.userImageDefault);
  }
}
