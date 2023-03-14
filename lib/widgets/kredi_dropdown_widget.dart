import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_constant.dart';
import 'package:flutter_application_1/helper/data_helper.dart';

class KrediDropDownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  KrediDropDownWidget({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  State<KrediDropDownWidget> createState() => _KrediDropDownWidgetState();
}

class _KrediDropDownWidgetState extends State<KrediDropDownWidget> {
  double krediDegeri = 1.0;
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
          value: krediDegeri,
          items: DataHelper.tumKrediler(),
          onChanged: (gelenKrediDegeri) {
            setState(() {
              krediDegeri = gelenKrediDegeri!;
              widget.onKrediSecildi(gelenKrediDegeri);
            });
          }),
    );
  }
}
