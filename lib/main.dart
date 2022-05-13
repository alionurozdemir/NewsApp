import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}
