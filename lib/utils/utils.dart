import 'package:climbit/models/user_model.dart';
import 'package:climbit/services/user_service.dart';
import 'package:flutter/material.dart';
import 'firebase.dart';

class Utils {
  static final messangerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) {
      return;
    }
    final snackBar = SnackBar(content: Text(text));

    messangerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static String currentUid() {
    return firebaseAuth.currentUser!.uid;
  }

  static String currentEmail() {
    return firebaseAuth.currentUser!.email!;
  }

  static String currentUsername() {
    UserModel user = UserService.getUser(Utils.currentUid()) as UserModel;
    return user.username;
  }
}
