import 'package:flutter/material.dart';
import '/widget/place_card.dart';

class HotelsView extends StatefulWidget {
  @override
  _HotelsViewState createState() => _HotelsViewState();
}

class _HotelsViewState extends State<HotelsView> {
  final List<Map<String, dynamic>> hotels = [
    {
      "title": "Holiday Greenwich Hotel",
      "image": "assets/image/badira_hammemt.jpg",
      "rating": 4.5,
      "reviews": 120,
      "distance": 2093.25,
      "price": "\$95",
    },
    {
      "title": "Luxury Inn",
      "image": "assets/image/laico tunis.jpg",
      "rating": 4.8,
      "reviews": 85,
      "distance": 1987.5,
      "price": "\$120",
    },
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotels"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              onChanged: (value) => setState(() => searchQuery = value.toLowerCase()),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search hotels...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                if (searchQuery.isNotEmpty &&
                    !hotels[index]["title"].toLowerCase().contains(searchQuery)) {
                  return Container(); // Cache les résultats non pertinents
                }
                return PlaceCard(
                  imageUrl: hotels[index]["image"],
                  title: hotels[index]["title"],
                  rating: hotels[index]["rating"],
                  reviews: hotels[index]["reviews"],
                  distance: hotels[index]["distance"],
                  price: hotels[index]["price"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
