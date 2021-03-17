import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vp_sosyal_m/profilsayfasi.dart';
import 'gönderikarti.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "VPSocial",
          style: TextStyle(fontSize: 20.0, color: Colors.grey),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications,
                  color: Colors.purple[300], size: 32.0),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          duyuru("Ahmet seni takip etti", "3 dakika önce"),
                          duyuru("Halil fotoğrafını beğendi", "25 dakika"),
                          duyuru("Ahmet Çakar mesaj yolladı", "3 saniye"),
                        ],
                      );
                    });
              })
        ],
        elevation: 0.00,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.grey, size: 32.0),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
              BoxShadow(color: Colors.grey, offset: Offset(0, 3), blurRadius: 5)
            ]),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                profilkarti(
                    "https://cdn.pixabay.com/photo/2015/09/02/12/58/woman-918788_960_720.jpg",
                    "Selin",
                    "Selin Deniz",
                    "https://cdn.pixabay.com/photo/2013/07/18/10/56/railroad-163518__340.jpg"),
                profilkarti(
                    "https://cdn.pixabay.com/photo/2016/11/22/21/42/adult-1850703_960_720.jpg",
                    "Ayşe",
                    "Ayşe Yanyürüyen",
                    "https://cdn.pixabay.com/photo/2012/08/06/00/53/bridge-53769__340.jpg"),
                profilkarti(
                    "https://cdn.pixabay.com/photo/2014/09/25/22/14/profile-461076_960_720.jpg",
                    "Dilara",
                    "Dilara Seymen",
                    "https://cdn.pixabay.com/photo/2014/08/15/11/29/beach-418742__340.jpg"),
                profilkarti(
                    "https://cdn.pixabay.com/photo/2016/11/21/14/53/adult-1845814__340.jpg",
                    "Deniz",
                    "Deniz Koşar",
                    "https://cdn.pixabay.com/photo/2014/10/07/13/48/mountain-477832__340.jpg"),
                profilkarti(
                    "https://cdn.pixabay.com/photo/2016/11/29/06/46/adult-1867887__340.jpg",
                    "Ahmet",
                    "Ahmet Çakar",
                    "https://cdn.pixabay.com/photo/2017/05/09/03/46/alberta-2297204__340.jpg"),
                profilkarti(
                    "https://cdn.pixabay.com/photo/2016/03/09/15/10/man-1246508__340.jpg",
                    "Ali",
                    "Ali Takıcı",
                    "https://cdn.pixabay.com/photo/2016/10/21/09/25/sunset-1757593__340.jpg"),
              ],
            ),
          ),
          SizedBox(height: 10),
          GonderiKarti(
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2021/02/12/09/36/sunflowers-6007847_960_720.jpg",
            isimSoyad: "Onur Çelebi",
            gecensure: "25 saniye önce",
            aciklama: "Ordudaki ayçiçeği tarlamız.",
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2021/03/08/02/38/man-6077947_960_720.jpg",
          ),
          GonderiKarti(
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2016/11/29/02/05/audience-1866738_960_720.jpg",
            isimSoyad: "Ahmet Çakar",
            gecensure: "1 saat önce",
            aciklama: "Son maçtan kare",
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2019/10/19/21/59/football-4562381_960_720.jpg",
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.purple[300],
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }

  Padding duyuru(String mesaj, String gecenSure) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(mesaj, style: TextStyle(fontSize: 15.0)),
          Text(gecenSure),
        ],
      ),
    );
  }

  Widget profilkarti(String url, String kullaniciAdi, String isimSoyad,
      String kapakResimlinki) {
    return Material(
      child: InkWell(
        onTap: () async {
          Future<dynamic> donenVeri =
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProfilSayfasi(
                        profilResimlinki: url,
                        kullaniciAdi: kullaniciAdi,
                        isimSoyad: isimSoyad,
                        kapakResimlinki: kapakResimlinki,
                      )));
          print(await donenVeri);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Hero(
                    tag: kullaniciAdi,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(url)),
                          color: Colors.white,
                          border: Border.all(width: 2.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(35.0)),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.0, color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.5,
              ),
              Text(
                kullaniciAdi,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
