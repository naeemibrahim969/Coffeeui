import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeType;
  final bool isSelected;
  final VoidCallback onTapp;

  const CoffeeType({
    Key? key,
    required this.coffeType,
    required this.isSelected,
    required this.onTapp
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapp,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          coffeType,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.grey
          ),
        ),
      ),
    );
  }
}
