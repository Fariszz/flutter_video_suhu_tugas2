import 'package:flutter/material.dart';

class PerhitunganTerakhir extends StatelessWidget {
  const PerhitunganTerakhir({
    Key? key,
    required this.hasilPerhitungan,
  }) : super(key: key);

  final double hasilPerhitungan;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$hasilPerhitungan",
      style: TextStyle(fontSize: 32),
    );
  }
}