import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_chat/pages/home_page.dart';
import 'package:live_chat/pages/signin_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState()=>_LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FirebaseUser _user;

  @override
  void initState() {
    super.initState();
    _checkUser();
  }
  @override
  Widget build(BuildContext context) {
    if(_user == null){
      return SigninPage(
        onSignIn: (user){
          _updateUser(user);
        },
      );
    } else {
      return HomePage(
        user: _user,
        onSignOut: (){
          _updateUser(null);
        },
        );
    }
  }

  Future<void> _checkUser() async {
    _user = await FirebaseAuth.instance.currentUser();
  }

  void _updateUser(FirebaseUser user){
    setState(() {
      _user = user;
    });
  }
}