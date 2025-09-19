import 'dart:math';
import 'package:flutter/material.dart';

Color randomColor() {
  final random = Random();

  // Hue: 0-360 grados (ángulo de color)
  final hue = random.nextDouble() * 360;

  // Saturación: mínimo 0.5 para evitar colores apagados
  final saturation = 0.5 + random.nextDouble() * 0.5; // 0.5 a 1.0

  // Valor (brillo): mínimo 0.5 para evitar tonos muy oscuros
  final value = 0.5 + random.nextDouble() * 0.5; // 0.5 a 1.0

  return HSVColor.fromAHSV(1.0, hue, saturation, value).toColor();
}
