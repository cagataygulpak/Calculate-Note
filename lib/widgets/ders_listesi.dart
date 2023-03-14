import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_constant.dart';

class DersListesi extends StatelessWidget {
  final Function onCikarilacakEleman;
  const DersListesi({required this.onCikarilacakEleman, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sabitler.dersler.length > 0
        ? ListView.builder(
            itemCount: Sabitler.dersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (gelenDeger) {
                  onCikarilacakEleman(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                        title: Text(Sabitler.dersler[index].ad),
                        subtitle: Text(
                            "Not Değeri : ${Sabitler.dersler[index].harfdegeri} , Kredi Değeri : ${Sabitler.dersler[index].krediDegeri}"),
                        leading: CircleAvatar(
                          child: Text((Sabitler.dersler[index].harfdegeri *
                                  Sabitler.dersler[index].krediDegeri)
                              .toStringAsFixed(0)),
                        )),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Container(
                child: Text(
              "Ders Giriniz",
              style: Sabitler.baslikStyle,
            )),
          );
  }
}
