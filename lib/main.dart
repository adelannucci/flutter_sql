import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/http/webclient.dart';

void main() {
  runApp(ByteBankApp());
  findAll().then((transactions) => print('new transactions $transactions'));
}

class ByteBankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber[900],
        accentColor: Colors.amberAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.amberAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
