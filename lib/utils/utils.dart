import 'package:climbit/models/gym_model.dart';
import 'package:climbit/models/user_model.dart';
import 'package:climbit/services/gym_service.dart';
import 'package:climbit/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  static String currentGymName() {
    GymModel gym = GymService.getGym(Utils.currentUid()) as GymModel;
    return gym.name;
  }

  static dateTimeToTimeStamp(dynamic date) {
    return DateTime.parse((date as Timestamp).toDate().toString());
  }
}
