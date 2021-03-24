import 'package:flutter/material.dart';

class Bariyerler extends StatelessWidget {
  final size;
  Bariyerler({this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: size,
      decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(width: 10, color: Colors.green[900]),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
