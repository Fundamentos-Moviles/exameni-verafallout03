import 'package:flutter/material.dart';

class ColorTile {
  final Color colorStart;
  final Color colorEnd;
  bool revealed;

  ColorTile({
    required this.colorStart,
    required this.colorEnd,
    this.revealed = false,
  });
}
