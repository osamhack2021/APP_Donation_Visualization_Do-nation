import 'package:app/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'Do! Nation';
    return GetMaterialApp(
      title: appName,
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'SCDream',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w900),
          headline2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          bodyText1: TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
