

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _modoOscuro = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _modoOscuro == true ? ThemeData.dark() : ThemeData.light(),
      home: Cuerpo(esOscuro: (value) {
        setState(() {
          _modoOscuro = value;
        });
      }),
    );
  }
}

class Cuerpo extends StatefulWidget {
  final ValueChanged esOscuro;
  const Cuerpo({super.key, required this.esOscuro});

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Holaa"),
        actions: [
          IconButton(
            onPressed: () {
              bool esOscuro = Theme.of(context).brightness == Brightness.dark;
              widget.esOscuro(!esOscuro);
            },
            icon: Icon(Theme.of(context).brightness == Brightness.dark
                ? Icons.light_mode
                : Icons.dark_mode),
            iconSize: 20,
          ),
        ],
      ),
    );
  }
}