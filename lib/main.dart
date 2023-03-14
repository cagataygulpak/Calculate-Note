import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_constant.dart';

import 'Widgets/ortalama_hesapla_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ortalama Hesapla",
      theme: ThemeData(
          primarySwatch: Sabitler.anaRenk,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const OrtalamaHesapla(),
    );
  }
}
