import 'package:flutter/material.dart';

import '../../utils/constants.dart';


class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Constants.appName.toUpperCase()),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
}