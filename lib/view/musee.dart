import 'package:flutter/material.dart';

class MuseumsView extends StatelessWidget {
  final List<String> museums = [
    "Louvre - Paris",
    "British Museum - Londres",
    "Metropolitan Museum - New York",
    "Musée d'Orsay - Paris",
    "Rijksmuseum - Amsterdam",
    "Vatican Museums - Rome",
    "National Gallery - Londres",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Musées"),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: museums.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.museum, color: Colors.purple),
            title: Text(museums[index]),
          );
        },
      ),
    );
  }
}
