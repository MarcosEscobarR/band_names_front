import 'package:band_names/src/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material-app',
      initialRoute: 'home',
      routes: {'home': (_) => HomePage()},
    );
  }
  // This widget is the root of your application.

}
