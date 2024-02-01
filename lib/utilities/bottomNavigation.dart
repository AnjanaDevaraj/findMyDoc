import 'package:findmydoc/Utilities/appColors.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  final Color _selectedColor = AppColors.themeColor;
  final Color _unselectedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      _buildNavItem(Icons.home,
          "", 0),
      _buildNavItem(
          Icons.favorite_border,
          "",
          1),
      _buildNavItem(
          Icons.history,
          "",
          2),
      _buildNavItem(
          Icons.person,
          "",
          3),
    ];

    return BottomNavigationBar(
      items: items,
      currentIndex: _selectedIndex,
      selectedItemColor: _selectedColor,
      unselectedItemColor: _selectedColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: (index) {
        if (index == 0) {
          // Check if the "Home" icon is clicked (index 0 in your items list)
          if (ModalRoute.of(context)!.settings.name != '/home') {
            Navigator.pushNamed(context, '/home');
          }
        } else if (index == 1) {
          // Check if the current route is not already "/favourites"
          if (ModalRoute.of(context)!.settings.name != '/favourites') {
            Navigator.pushNamed(context, '/favourites');
          }
        } else if (index == 2) {
          // Check if the current route is not already "/history"
          if (ModalRoute.of(context)!.settings.name != '/history') {
            Navigator.pushNamed(context, '/history');
          }
        } else if (index == 3) {
          // Check if the current route is not already "/profile"
          if (ModalRoute.of(context)!.settings.name != '/profile') {
            Navigator.pushNamed(context, '/profile');
          }
        } else {
          // For other items, update the selected index
          setState(() {
            _selectedIndex = index;
          });
        }
      },
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData iconData, String text, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        size: 30,
      ),
      label: text,
    );
  }

}
