import 'package:flutter/material.dart';
import '../widget/navbar.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paramètres")),
      body: Center(
        child: Text("Page des paramètres", style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: navbar(selectedIndex: 3, backgroundColor: Colors.blue),
    );
  }
}
