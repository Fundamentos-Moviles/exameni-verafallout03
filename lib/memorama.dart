import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memoramap1/colortile.dart';
import 'package:memoramap1/random_color.dart';

class Memorama extends StatefulWidget {
  const Memorama({super.key});

  @override
  State<Memorama> createState() => _MemoramaState();
}

class _MemoramaState extends State<Memorama> {
  late List<ColorTile> tiles;

  void initState() {
    super.initState();

    final List<Color> baseColors = [];
    while (baseColors.length < 10) {
      final nuevoColor = randomColor();
      if (!baseColors.contains(nuevoColor)) {
        baseColors.add(nuevoColor);
      }
    }

    tiles =
        List<ColorTile>.from(
          baseColors.map(
            (c) => ColorTile(colorStart: Colors.grey, colorEnd: c),
          ),
        )..addAll(
          baseColors.map(
            (c) => ColorTile(colorStart: Colors.grey, colorEnd: c),
          ),
        );

    tiles.shuffle(Random());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [Row(), Row(), Row()]));
  }
}
