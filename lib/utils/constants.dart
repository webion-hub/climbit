import 'package:climbit/screens/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Constants {
  static String appName = "Goly";
  static String userImageDefault =
      'https://firebasestorage.googleapis.com/v0/b/goly-app.appspot.com/o/user_image%2Fuser.jpeg?alt=media&token=3bb9a06b-fdde-42a7-aba0-1e570bed7899';

  static const pagePadding =
      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0);

  static const webScreenSize = 600;

  static final List<Widget> homeScreenItems = [
    //const DiscoverScreen(),
    //const GoalsScreen(),
    ProfileScreen(
      profileId: FirebaseAuth.instance.currentUser!.uid,
    ),
  ];  
  static IconData getLockerIcon({required bool private}) {
    return private ? Icons.lock_outline_rounded : Icons.lock_open_outlined;
  } 
}