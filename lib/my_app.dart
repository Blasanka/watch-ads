import 'package:flutter/material.dart';
import 'package:so_test/screens/home_page.dart';

//boilerplate that you use everywhere
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flexible GridView",
      home: HomePage(),
    );
  }
}
