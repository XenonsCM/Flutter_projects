import 'package:flutter/material.dart';

import 'urun_detay.dart';

class Kategori extends StatefulWidget {
  final String kategori;

  const Kategori({Key key, this.kategori}) : super(key: key);
  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  List<Widget> gosterilecekListe;
  @override
  void initState() {
    // ignore: unrelated_type_equality_checks
    if (widget.kategori == "Temel Gıda") {
      gosterilecekListe = [
        urunKarti("Zeytin Yaği", "43 TL",
            "https://cdn.pixabay.com/photo/2016/08/15/20/29/olive-oil-1596417_960_720.jpg",
            mevcut: true),
        urunKarti("Ekşi Mayalı Ekmek", "8 TL",
            "https://cdn.pixabay.com/photo/2016/03/26/18/23/bread-1281053_960_720.jpg"),
        urunKarti("Pirinç", "22 TL",
            "https://cdn.pixabay.com/photo/2017/05/08/04/33/rice-2294365_960_720.jpg",
            mevcut: true),
        urunKarti("Et", "66 TL",
            "https://cdn.pixabay.com/photo/2015/12/08/00/32/steak-1081819_960_720.jpg"),
      ];
      // ignore: unrelated_type_equality_checks
    } else if (widget.kategori == "Şekerleme") {
      gosterilecekListe = [
        urunKarti("Çikolatalı Gofret", "2.5 TL",
            "https://cdn.pixabay.com/photo/2015/12/08/00/32/steak-1081819_960_720.jpg"),
        urunKarti("Jelibon", " 7 TL",
            "https://cdn.pixabay.com/photo/2014/04/07/05/25/gummibarchen-318362_960_720.jpg",
            mevcut: true),
      ];
      // ignore: unrelated_type_equality_checks
    } else if (widget.kategori == "İçecek") {
      gosterilecekListe = [
        urunKarti("Coca Cola", " 7 TL",
            "https://cdn.pixabay.com/photo/2014/09/26/19/51/drink-462776_960_720.jpg"),
        urunKarti("Süt", " 8.5 TL",
            "https://cdn.pixabay.com/photo/2017/07/05/15/41/milk-2474993_960_720.jpg"),
        urunKarti("Portik Suyu", " 11 TL",
            "https://cdn.pixabay.com/photo/2016/08/23/15/52/fresh-orange-juice-1614822_960_720.jpg"),
      ];
      // ignore: unrelated_type_equality_checks
    } else if (widget.kategori == "Temizlik") {
      gosterilecekListe = [
        urunKarti("Tuvalet Kağidi", " 42 TL",
            "https://cdn.pixabay.com/photo/2019/01/30/12/35/toilet-paper-3964492_960_720.jpg"),
        urunKarti("Sabun", " 14 TL",
            "https://cdn.pixabay.com/photo/2016/02/19/10/40/soap-1209344_960_720.jpg"),
        urunKarti("Deodorant", " 19 TL",
            "https://cdn.pixabay.com/photo/2017/07/09/19/38/perfume-2487923_960_720.jpg"),
        urunKarti("Şampuan", " 15 TL",
            "https://cdn.pixabay.com/photo/2019/09/27/09/39/flatlay-4507971_960_720.jpg"),
      ];
    }
    super.initState();
  }

  Widget urunKarti(String isim, String fiyat, String resimUrl,
      {bool mevcut = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UrunDetay(
                      isim: isim,
                      fiyat: fiyat,
                      resimyolu: resimUrl,
                      mevcut: mevcut,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: resimUrl,
              child: Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(resimUrl), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(isim,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                )),
            SizedBox(
              height: 8.0,
            ),
            Text(fiyat,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[400],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      padding: EdgeInsets.all(10),
      childAspectRatio: 1,
      children: gosterilecekListe,
    );
  }
}
