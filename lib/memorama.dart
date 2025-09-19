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
  List<int> selected = [];
  int paresFound = 0;

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
    if (tiles[index].revealed) return;

    if (selected.length == 2) return;

    setState(() {
      tiles[index].revealed = !tiles[index].revealed;
      selected.add(index);
    });

    if (selected.length == 2) {
      final indexOne = selected[0];
      final indexTwo = selected[1];

      if (tiles[indexOne].colorEnd == tiles[indexTwo].colorEnd) {
        paresFound++;
        selected.clear();

        if (paresFound == 10) {
          Future.delayed(const Duration(milliseconds: 500), () {
            dialogoVictoria();
          });
        }
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            tiles[indexOne].revealed = tiles[indexTwo].revealed = false;
            selected.clear();
          });
        });
      }
    }
  }

  void dialogoVictoria() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Has encontrado los 10 pares."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _reiniciarJuego();
            },
            child: Text("Jugar de nuevo"),
          ),
        ],
      ),
    );
  }

  void _reiniciarJuego() {
    setState(() {
      paresFound = 0;
      selected.clear();

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
