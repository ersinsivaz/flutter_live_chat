import 'package:flutter/material.dart';
import 'package:live_chat/locator.dart';
import 'package:live_chat/pages/landing_page.dart';


void main() {
  setupLocator();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Lovers",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: LandingPage(),
    );
  }

}
