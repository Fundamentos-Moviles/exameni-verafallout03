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

  @override
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

  void _onTileTap(int index) {
    setState(() {
      tiles[index].revealed = !tiles[index].revealed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Memorama     Hiram Rodriguez Vera")),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: List.generate(tiles.length, (index) {
          final tile = tiles[index];
          return Card(
            color: tile.revealed ? tile.colorEnd : tile.colorStart,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 4,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => _onTileTap(index),
              child: const SizedBox.expand(),
            ),
          );
        }),
      ),
    );
  }
}
