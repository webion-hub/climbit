import 'package:climbit/screens/homepage.dart';
import 'package:climbit/screens/profile/profile_screen.dart';
import 'package:climbit/screens/saved_screen.dart';
import 'package:climbit/utils/utils.dart';
import 'package:flutter/material.dart';

class PageCore extends StatefulWidget {
  const PageCore({super.key});

  @override
  State<PageCore> createState() => _PageCoreState();
}

class _PageCoreState extends State<PageCore> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SavedScreen(),
    ProfileScreen(profileId: Utils.currentUid()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Saved',
              icon: Icon(Icons.bookmark_sharp),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
