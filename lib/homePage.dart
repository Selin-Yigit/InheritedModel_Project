import 'package:flutter/material.dart';
import 'dart:math' show Random;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 430,
            color: Colors.amber,
          ),
        ],
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
  Colors.pink.shade400,
  Colors.red,
];

// T => iterable generic olduğu için kullanılıyor.
extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(Random().nextInt(length));
}
