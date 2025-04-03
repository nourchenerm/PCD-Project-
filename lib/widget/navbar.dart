import 'package:flutter/material.dart';
import '/view/home_page.dart';
import '/view/favorite_screen.dart';
import '/view/login_screen.dart';
import '/view/category_view.dart';

class navbar extends StatelessWidget {
  final int selectedIndex;
  final Color backgroundColor;

  navbar({
    required this.selectedIndex,
    required this.backgroundColor,
  });

  void _navigateToScreen(BuildContext context, int index) {
    Widget nextScreen;

    switch (index) {
      case 0:
        nextScreen = HomePage();
        break;
      case 1:
        nextScreen = FavoriteScreen();
        break;
      case 2:
        nextScreen = LoginScreen();
        break;
      case 3:
        nextScreen = CategoryView();
        break;
      default:
        nextScreen = HomePage();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: selectedIndex == 0 ? Colors.white : Colors.grey),
            onPressed: () => _navigateToScreen(context, 0),
          ),
          IconButton(
            icon: Icon(Icons.favorite, color: selectedIndex == 1 ? Colors.white : Colors.grey),
            onPressed: () => _navigateToScreen(context, 1),
          ),
          IconButton(
            icon: Icon(Icons.login, color: selectedIndex == 2 ? Colors.white : Colors.grey),
            onPressed: () => _navigateToScreen(context, 2),
          ),
          IconButton(
            icon: Icon(Icons.settings, color: selectedIndex == 3 ? Colors.white : Colors.grey),
            onPressed: () => _navigateToScreen(context, 3),
          ),
        ],
      ),
    );
  }
}
