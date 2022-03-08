import 'package:flutter/material.dart';
import 'package:video_suhu/widgets/InputSuhu.dart';
import 'package:video_suhu/widgets/KonversiSuhu.dart';
import 'package:video_suhu/widgets/PerhitunganTerakhir.dart';
import 'package:video_suhu/widgets/RiwayatPerhitungan.dart';
import 'package:video_suhu/widgets/TargetPerhitungan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectedDropdown = "Kelvin";
  double hasilPerhitungan = 0.0;
  List<String> listHasil = [];

  void onDropdownChanged(Object? value) {
    return setState(() {
      selectedDropdown = value.toString();
    });
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropdown) {
          case "Kelvin":
            hasilPerhitungan = double.parse(etInput.text) + 273.15;
            break;
          case "Reamur":
            hasilPerhitungan = double.parse(etInput.text) * 4 / 5;
            break;
          case "Fahrenheit":
            hasilPerhitungan = (double.parse(etInput.text) * 9 / 5) + 32;
            break;
        }
        listHasil.add("Konversi dari " +
            etInput.text +
            " Celcius ke " +
            selectedDropdown +
            " Dengan hasil " +
            hasilPerhitungan.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            InputSuhu(etInput: etInput),
            const SizedBox(
              height: 8,
            ),

            // ignore: prefer_const_literals_to_create_immutables
            TargetPerhitungan(
              selectedDropdown: selectedDropdown,
              listSatuanSuhu: listSatuanSuhu,
              onDropdownChanged: onDropdownChanged,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Hasil",
              style: TextStyle(fontSize: 18),
            ),
            PerhitunganTerakhir(hasilPerhitungan: hasilPerhitungan),
            const SizedBox(
              height: 10,
            ),
            KonversiSuhu(
              onPressed: konversiSuhu,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Riwayat Konversi",
              style: TextStyle(fontSize: 20),
            ),
            RiwayatPerhitungan(listHasil: listHasil)
          ],
        ),
      ),
    );
  }
}
