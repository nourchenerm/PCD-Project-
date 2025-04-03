import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart'; // Import de geocoding

class FullScreenMapPage extends StatefulWidget {
  @override
  _FullScreenMapPageState createState() => _FullScreenMapPageState();
}

class _FullScreenMapPageState extends State<FullScreenMapPage> {
  MapController _mapController = MapController();  // Contrôleur de la carte
  TextEditingController _searchController = TextEditingController();  // Contrôleur de la barre de recherche
  String _searchQuery = ''; // Stocke la valeur de la recherche
  LatLng _currentPosition = LatLng(48.8566, 2.3522); // Position initiale (Paris)

  // Fonction de recherche réelle avec géocodage
  void _searchLocation() async {
    if (_searchQuery.isNotEmpty) {
      try {
        // Utilisation du package geocoding pour obtenir la latitude et la longitude
        List<Location> locations = await locationFromAddress(_searchQuery);

        // Si des résultats sont trouvés, mettre à jour la position
        if (locations.isNotEmpty) {
          setState(() {
            _currentPosition = LatLng(locations[0].latitude, locations[0].longitude);
          });
          // Déplace la carte vers la nouvelle position avec un zoom de 15
          _mapController.move(_currentPosition, 15.0);
        }
      } catch (e) {
        // En cas d'erreur, afficher un message (par exemple, adresse introuvable)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lieu non trouvé')),
        );
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carte en plein écran"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),  // Ferme la page
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: _currentPosition,
              zoom: 12.0,
              interactiveFlags: InteractiveFlag.all, // Permet toutes les interactions sur la carte
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _currentPosition,
                    width: 40,
                    height: 40,
                    child: Icon(Icons.location_pin, color: Colors.red, size: 40),
                  ),
                ],
              ),
            ],
          ),
          // Barre de recherche en haut
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 3)),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.blue),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Rechercher un lieu...',
                        border: InputBorder.none,
                      ),
                      onChanged: (query) {
                        setState(() {
                          _searchQuery = query;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.blue),
                    onPressed: _searchLocation,
                  ),
                ],
              ),
            ),
          ),
          // Boutons flottants pour zoom et localisation
          Positioned(
            bottom: 20,
            left: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _mapController.move(_currentPosition, 15.0); // Zoom sur la position actuelle
                  },
                  child: Icon(Icons.my_location),
                  backgroundColor: Colors.blue,
                  tooltip: 'Position actuelle',
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () {
                    _mapController.move(_currentPosition, 18.0); // Zoom avant
                  },
                  child: Icon(Icons.zoom_in),
                  backgroundColor: Colors.blue,
                  tooltip: 'Zoom avant',
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () {
                    _mapController.move(_currentPosition, 10.0); // Zoom arrière
                  },
                  child: Icon(Icons.zoom_out),
                  backgroundColor: Colors.blue,
                  tooltip: 'Zoom arrière',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
