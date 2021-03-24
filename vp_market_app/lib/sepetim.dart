import 'package:flutter/material.dart';

class Sepetim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
            child: Text(
          "Sepetim",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red[400]),
        )),
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Column(
            children: [
              ListTile(
                title: Text("Karaorman Pastasi"),
                subtitle: Text("1 adet x 24.5"),
                trailing: Text("24.5"),
              ),
              ListTile(
                title: Text("Sütlü ve Antep Fıstıklı Çikolata"),
                subtitle: Text("2 adet x 6.5"),
                trailing: Text("13.0"),
              ),
              ListTile(
                title: Text("Dondurulmuş Patates"),
                subtitle: Text("3 adet x 13.5"),
                trailing: Text("40.5"),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Column(
                children: [
                  Text(
                    "Toplam Tutar",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[400]),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "88 TL ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[400]),
            child: Center(
              child: Text(
                "Alişverişi Tamamla",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
