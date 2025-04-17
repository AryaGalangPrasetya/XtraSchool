import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(XtraScholApp());

class XtraScholApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XtraSchol',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
