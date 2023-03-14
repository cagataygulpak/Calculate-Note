import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_constant.dart';
import 'package:flutter_application_1/helper/data_helper.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  HarfDropDownWidget({required this.onHarfSecildi, Key? key}) : super(key: key);

  @override
  State<HarfDropDownWidget> createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double deger = 4.0;
  @override
  Widget build(BuildContext context) {
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
              widget.onHarfSecildi(deger);
            });
          },
        ));
  }
}
