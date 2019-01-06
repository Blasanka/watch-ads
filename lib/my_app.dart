import 'package:flutter/material.dart';
import 'home_page.dart';

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
