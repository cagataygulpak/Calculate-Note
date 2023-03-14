import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _harfler() {
    return ["AA", "BA", "BB", "BC", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harfleriDegereDonustur(String harf) {
    switch (harf) {
      case "AA":
        return 4.0;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "BC":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0;
      default:
        return -1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _harfler()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: _harfleriDegereDonustur(e.toString()),
            ))
        .toList();
  }

  static List<double> krediler() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<double>> tumKrediler() {
    return krediler()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e,
            ))
        .toList();
  }
}
