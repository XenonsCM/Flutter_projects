import 'package:flutter/material.dart';
import 'package:vp_market_app/kategori.dart';

class Urunler extends StatefulWidget {
  @override
  _UrunlerState createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> with SingleTickerProviderStateMixin {
  TabController televizyonKontrolcusu;
  @override
  void initState() {
    super.initState();
    televizyonKontrolcusu = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: televizyonKontrolcusu,
            indicatorColor: Colors.red[400],
            labelColor: Colors.red[400],
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            tabs: [
              Tab(
                child: Text(
                  "Temel Gıda",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              Tab(
                child: Text("Şekerleme",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ),
              Tab(
                child: Text("İçecek",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ),
              Tab(
                child: Text("Temizlik",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ),
            ]),
        Expanded(
          child: TabBarView(
            controller: televizyonKontrolcusu,
            children: [
              Kategori(
                kategori: "Temel Gıda",
              ),
              Kategori(
                kategori: "Şekerleme",
              ),
              Kategori(
                kategori: "İçecek",
              ),
              Kategori(
                kategori: "Temizlik",
              ),
            ],
          ),
        )
      ],
    );
  }
}
