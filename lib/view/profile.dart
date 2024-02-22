import 'package:flutter/material.dart';

import '../utilities/bottomNavigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
