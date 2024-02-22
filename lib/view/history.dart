import 'package:flutter/material.dart';

import '../utilities/bottomNavigation.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("History"),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
