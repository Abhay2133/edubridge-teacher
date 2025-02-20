import 'package:flutter/material.dart';

class IconedCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const IconedCard({required this.icon, required this.title, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, // Background color of the card
      borderRadius: BorderRadius.circular(12),
      elevation: 4, // Card shadow
      child: InkWell(
        onTap: onTap, // Handles tap
        borderRadius: BorderRadius.circular(12), // Ripple effect inside the card
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blue), // Icon
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Text
            ],
          ),
        ),
      ),
    );
  }
}
