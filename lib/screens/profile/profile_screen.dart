import 'package:climbit/models/user_model.dart';
import 'package:climbit/widget/layout/profile_appbar.dart';
import 'package:climbit/widget/loading/loading_wheel.dart';
import 'package:climbit/widget/profile/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String profileId;
  const ProfileScreen({super.key, required this.profileId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(profileId)
                .snapshots(),
            builder: (context, snapshot) {
              return FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(profileId)
                    .get(),
                builder: ((context, snapshot) {
                  if (snapshot.data?.data() == null) {
                    return const LoadingWheel();
                  }
                UserModel user = UserModel.fromJson(snapshot.data?.data() as Map<String, dynamic>);
                  return UserProfile(user: user);
                }),
              );
            }),
      ),
    );
  }
}