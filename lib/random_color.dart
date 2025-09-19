import 'dart:math';
import 'package:flutter/material.dart';

Color randomColor() {
  final random = Random();
  final hue = random.nextDouble() * 360;
  final saturation = 0.5 + random.nextDouble() * 0.5;
  final value = 0.5 + random.nextDouble() * 0.5;
  return HSVColor.fromAHSV(1.0, hue, saturation, value).toColor();
}
