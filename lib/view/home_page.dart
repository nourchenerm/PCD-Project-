import 'package:flutter/material.dart';
import '/widget/navbar.dart'; // Importez votre composant Navbar
import '/widget/MapWidget.dart';
import '/widget/AR.dart';
import '/widget/calendar.dart';
import '/widget/chatbot.dart';
import '/widget/search_widget.dart';  // Importez le SearchWidget
import '/widget/catalogue_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;  // L'index de l'élément sélectionné dans la navbar
  TextEditingController _controller = TextEditingController();  // Contrôleur pour le champ de recherche
  String _searchQuery = '';  // Stocke la valeur de la recherche

  // Liste des pages correspondant aux éléments de la navbar
  List<Widget> _pages = [
    Center(child: Text('Page Home')),
    Center(child: Text('Page Favoris')),
    Center(child: Text('Page Login')),
    Center(child: Text('Page Paramètres')),
  ];

  // Fonction appelée quand un élément de la navbar est sélectionné
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guide Me'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ajoutez le widget de recherche ici
            SearchWidget(
              controller: _controller,
              hintText: 'Rechercher...',
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;  // Mettez à jour la recherche
                });
              },
            ),
            SizedBox(height: 20),  // Espacement entre la barre de recherche et le contenu

            // Premier Row avec MapWidget et AR() alignés horizontalement
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: MapWidget()),  // Utilisation d'Expanded pour une meilleure gestion de l'espace
                  SizedBox(width: 10),
                  Expanded(child: AR()),
                ],
              ),
            ),

            // Deuxième Row avec plusieurs widgets alignés horizontalement
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: chatbot()),
                  SizedBox(width: 10),
                  Expanded(child: calendar()),
                  SizedBox(width: 10),

                ],
              ),
            ),
            SizedBox(height: 15),
            CatalogueWidget(),  // Ajout du widget catalogue
          ],
        ),
      ),
      bottomNavigationBar: navbar(
        selectedIndex: _selectedIndex,
       // onItemTapped: _onItemTapped,
        backgroundColor: Colors.blue,  // Couleur de fond de la navbar
      ),
    );
  }
}
