import 'package:flutter/material.dart';
import 'package:imc_app/pages/home.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // root da aplicação.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
