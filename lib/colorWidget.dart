import 'package:flutter/material.dart';
import 'package:inheritedmodel_project/availableColorWidget.dart';
import 'package:inheritedmodel_project/homePage.dart';
import 'dart:developer' as devtools show log;

class ColorWidget extends StatelessWidget {
  const ColorWidget({super.key, required this.color});

  final AvailableColors color;
  @override
  Widget build(BuildContext context) {
    switch (color) {
      case AvailableColors.one:
        devtools.log("Color1 widget got rebuilt !!");
        break;
      case AvailableColors.two:
        devtools.log("Color2 widget got rebuilt !!");
        break;
    }

    final provider = AvailableColorWidget.of(context, color);

    return Container(
      height: 100,
      color: color == AvailableColors.one ? provider.color1 : provider.color2,
      child: Center(
        child: Text(
          color == AvailableColors.one ? "Color1" : "Color2",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
