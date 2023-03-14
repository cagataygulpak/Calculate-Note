import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/ders.dart';

class Sabitler {
  static const anaRenk = Colors.indigo;
  static const String baslik = "Ortalama Hesapla";
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);
  static BorderRadius borderRadius = BorderRadius.circular(24);
  static TextStyle ortalamaYaziStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w900, color: anaRenk);
  static TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 32, fontWeight: FontWeight.w600, color: anaRenk);
  static const padding = EdgeInsets.symmetric(vertical: 8, horizontal: 16);
  static const yatayPadding = EdgeInsets.symmetric(horizontal: 5);
  static List<Ders> dersler = [];
  static dersEkle(gelenDers) {
    dersler.add(gelenDers);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;
    double ortalama = 0;

    dersler.forEach((element) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfdegeri);
      toplamKredi += element.krediDegeri;
    });

    ortalama = toplamNot / toplamKredi;
    return ortalama;
  }
}
