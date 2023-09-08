import 'package:flutter/material.dart';
import 'package:tiktok_hackers/pages/home_page.dart';
import 'package:tiktok_hackers/pages/shop_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   useMaterial3: true,
      // ),
      home: HomePage(),
    );
  }
}
