import 'package:flutter/material.dart';
import 'dart:math' show Random;

import 'package:inheritedmodel_project/availableColorWidget.dart';
import 'package:inheritedmodel_project/colorWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _color1 = Colors.teal;
  var _color2 = Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: AvailableColorWidget(
        color1: _color1,
        color2: _color2,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey.shade900),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _color1 = colors.getRandomElement();
                        });
                      },
                      child: Text(
                        "Change Color1",
                        style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey.shade900),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _color2 = colors.getRandomElement();
                        });
                      },
                      child: Text(
                        "Change Color2",
                        style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const ColorWidget(color: AvailableColors.one),
            const SizedBox(height: 10),
            const ColorWidget(color: AvailableColors.two),
          ],
        ),
      ),
    );
  }
}

enum AvailableColors { one, two }

final colors = [
  Colors.amber,
  Colors.blue,
  Colors.brown,
  Colors.cyan,
  Colors.green,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.red,
];

// T => iterable generic olduğu için kullanılıyor.
extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(Random().nextInt(length));
}
