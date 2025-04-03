import 'package:flutter/material.dart';

class AR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.grey[300], // Placeholder pour la carte
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Icon(Icons.view_in_ar, size: 80, color: Colors.grey[600]),

      ),
    );
  }
}
