import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final Color color;
  final ValueChanged<Color> onTap;

  ColorButton({
    required this.color,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(color),
      child: Container(
        width: 50,
        height: 50,
        color: color,
      ),
    );
  }
}
