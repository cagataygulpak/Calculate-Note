import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/ortalama_goster.dart';
import 'package:flutter_application_1/constant/app_constant.dart';
import 'package:flutter_application_1/helper/data_helper.dart';
import 'package:flutter_application_1/widgets/ders_listesi.dart';
import 'package:flutter_application_1/widgets/harf_dropdown_widget.dart';
import 'package:flutter_application_1/widgets/kredi_dropdown_widget.dart';

import '../model/ders.dart';

class OrtalamaHesapla extends StatefulWidget {
  const OrtalamaHesapla({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesapla> createState() => _OrtalamaHesaplaState();
}

class _OrtalamaHesaplaState extends State<OrtalamaHesapla> {
  var formkey = GlobalKey<FormState>();
  double deger = 4.0;
  double krediDegeri = 1.0;
  String girilenDersDegeri = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            Sabitler.baslik,
            style: Sabitler.baslikStyle,
          ),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(flex: 3, child: _buildFormOlustur()),
                  Expanded(
                    child: OrtalamaGoster(
                        dersSayisi: Sabitler.dersler.length,
                        ortalama: Sabitler.ortalamaHesapla()),
                  ),
                ],
              ),
            ),
            Expanded(child: DersListesi(
              onCikarilacakEleman: (index) {
                Sabitler.dersler.removeAt(index);
                setState(() {});
              },
            )),
          ],
        ));
  }

  Widget _buildFormOlustur() {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: Sabitler.yatayPadding,
            child: _textFieldOlustur(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding,
                  child: HarfDropDownWidget(onHarfSecildi: (harf) {
                    deger = harf;
                  }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding,
                  child: KrediDropDownWidget(onKrediSecildi: (kredi) {
                    krediDegeri = kredi;
                  }),
                ),
              ),
              Padding(
                padding: Sabitler.yatayPadding,
                child: IconButton(
                    color: Sabitler.anaRenk,
                    iconSize: 30,
                    onPressed: _dersEkleveOrtalamaHesapla,
                    icon: Icon(Icons.arrow_forward_ios_sharp)),
              )
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  /* Widget buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.padding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade200.withOpacity(0.5),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
          elevation: 16,
          iconEnabledColor: Sabitler.anaRenk.shade200,
          value: krediDegeri,
          items: DataHelper.tumKrediler(),
          onChanged: (gelenKrediDegeri) {
            setState(() {
              krediDegeri = gelenKrediDegeri!;
            });
          }),
    );
  } */

  /* Widget buildHarfler() {
    return Container(
        alignment: Alignment.center,
        padding: Sabitler.padding,
        decoration: BoxDecoration(
            color: Sabitler.anaRenk.shade200.withOpacity(0.5),
            borderRadius: Sabitler.borderRadius),
        child: DropdownButton<double>(
          elevation: 16,
          iconEnabledColor: Sabitler.anaRenk.shade200,
          value: deger,
          items: DataHelper.tumDerslerinHarfleri(),
          onChanged: (gelenDeger) {
            setState(() {
              deger = gelenDeger!;
            });
          },
        ));
  } */

  Widget _textFieldOlustur() {
    return TextFormField(
      onSaved: (newValue) {
        girilenDersDegeri = newValue!;
      },
      validator: (e) {
        if (e!.length <= 0) {
          return "Ders Giriniz";
        }
      },
      decoration: InputDecoration(
          hintText: "Ders Giriniz",
          border: OutlineInputBorder(borderRadius: Sabitler.borderRadius),
          filled: true,
          fillColor: Sabitler.anaRenk.shade600.withOpacity(0.2)),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersDegeri, harfdegeri: deger, krediDegeri: krediDegeri);
      Sabitler.dersEkle(eklenecekDers);

      setState(() {});
    }
  }
}
