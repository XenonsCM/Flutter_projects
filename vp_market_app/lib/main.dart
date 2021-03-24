import 'package:flutter/material.dart';
import 'package:vp_market_app/ayarlar.dart';
import 'package:vp_market_app/sepetim.dart';
import 'package:vp_market_app/urunler.dart';

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
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int aktifIcerikNo = 0;
  List<Widget> _icerikler;

  @override
  void initState() {
    super.initState();
    _icerikler = [Urunler(), Sepetim()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Volkan Peker"),
              accountEmail: Text("vp@gmail.com"),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2014/04/12/14/59/portrait-322470_960_720.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(50.0)),
              ),
              decoration: BoxDecoration(color: Colors.red[400]),
            ),
            ListTile(
              title: Text("Siparişlerim"),
              onTap: () {},
            ),
            ListTile(
              title: Text("İndirimlerim"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Ayarlar"),
              // ignore: missing_required_param
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Ayarlar();
                }));
              },
            ),
            ListTile(
              title: Text("Çıkış Yap"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.red[400]),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Bir Tıkla Kapında",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          )),
      body: _icerikler[aktifIcerikNo],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: aktifIcerikNo,
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey[600],
        items: [
          // ignore: deprecated_member_use
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text("Ürünler"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            // ignore: deprecated_member_use
            title: Text("Sepetim"),
          )
        ],
        onTap: (int tiklananButtonPozisyonu) {
          setState(() {
            aktifIcerikNo = tiklananButtonPozisyonu;
          });
        },
      ),
    );
  }
}
