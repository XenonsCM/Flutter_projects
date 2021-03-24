import 'package:flutter/material.dart';

class UrunDetay extends StatelessWidget {
  final String isim;
  final String fiyat;
  final String resimyolu;
  final bool mevcut;

  const UrunDetay({Key key, this.isim, this.fiyat, this.resimyolu, this.mevcut})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            Hero(tag: resimyolu, child: Image.network(resimyolu)),
            IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.red[400], size: 40),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(isim,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text(fiyat,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[400])),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 15.0),
              child: Text("Ürün kalitesinden ve üreticisinden bahsedilecek",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              decoration: BoxDecoration(
                  color: mevcut ? Colors.red : Colors.black,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(mevcut ? "Sepete Ekle" : "Stokta Yok",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            )
          ],
        )
      ],
    ));
  }
}
