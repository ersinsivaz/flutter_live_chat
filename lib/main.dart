import 'package:flutter/material.dart';
import 'package:live_chat/pages/landing_page.dart';
import 'package:live_chat/services/firebase_auth_service.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Lovers",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: LandingPage(authService: FirebaseAuthService(),),
    );
  }

}
