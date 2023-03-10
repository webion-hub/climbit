import 'package:climbit/models/user_model.dart';
import 'package:climbit/screens/profile/handle_profile_screen.dart';
import 'package:climbit/utils/utils.dart';
import 'package:climbit/widget/buttons/main_outlined_button.dart';
import 'package:climbit/widget/profile/user_image.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;
  const UserProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 140,
          height: 140,
          child: UserImage(imageUrl: user.photoUrl),
        ),
        const SizedBox(height: 20),
        Text(
          user.username,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        MainOutlinedButton(
          label: const Text('Edit profile'),
          icon: Icons.edit,
          action: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HandleProfileScreen(uid: Utils.currentUid())));
          },
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }
}