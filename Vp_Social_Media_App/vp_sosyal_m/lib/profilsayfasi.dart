import 'package:flutter/material.dart';
import 'package:vp_sosyal_m/g%C3%B6nderikarti.dart';

class ProfilSayfasi extends StatelessWidget {
  final String isimSoyad;
  final String kullaniciAdi;
  final String kapakResimlinki;
  final String profilResimlinki;

  const ProfilSayfasi(
      {Key key,
      this.isimSoyad,
      this.kullaniciAdi,
      this.kapakResimlinki,
      this.profilResimlinki})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 230,
                  //color: Colors.yellow
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            kapakResimlinki,
                          ))),
                ),
                Positioned(
                  left: 20,
                  bottom: 0,
                  child: Hero(
                    tag: kullaniciAdi,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(profilResimlinki),
                              fit: BoxFit.cover),
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(width: 2.0, color: Colors.white)),
                    ),
                  ),
                ),
                Positioned(
                  top: 190,
                  left: 145,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        isimSoyad,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        kullaniciAdi,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 130,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                        border: Border.all(width: 2.0, color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add_circle, size: 18),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          "Takip Et",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context, "Döndüm");
                    })
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 75,
              color: Colors.grey.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sayac("Takipçi", "20k"),
                  sayac("Takip", "602"),
                  sayac("Paylaşim", "32"),
                ],
              ),
            ),
            GonderiKarti(
              gonderiResimLinki:
                  "https://cdn.pixabay.com/photo/2021/02/12/09/36/sunflowers-6007847_960_720.jpg",
              isimSoyad: "Onur Çelebi",
              gecensure: "25 saniye önce",
              aciklama: "Ordudaki ayçiçeği tarlamız.",
              profilResimLinki:
                  "https://cdn.pixabay.com/photo/2021/03/08/02/38/man-6077947_960_720.jpg",
            )
          ],
        ));
  }

  Column sayac(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sayi,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 1.0,
        ),
        Text(
          baslik,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600]),
        )
      ],
    );
  }
}
