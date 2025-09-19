import 'dart:math';
import 'package:flutter/material.dart';

Color randomColor() {
  final random = Random();

  final hue = random.nextDouble() * 360;

  final saturation = 0.8 + random.nextDouble() * 0.2; // entre 0.8 y 1.0
  final value = 0.8 + random.nextDouble() * 0.2; // entre 0.8 y 1.0

  return HSVColor.fromAHSV(1.0, hue, saturation, value).toColor();
}
