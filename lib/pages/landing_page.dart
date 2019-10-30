import 'package:flutter/material.dart';
import 'package:live_chat/locator.dart';
import 'package:live_chat/models/user_model.dart';
import 'package:live_chat/pages/home_page.dart';
import 'package:live_chat/pages/signin_page.dart';
import 'package:live_chat/services/auth_base_service.dart';
import 'package:live_chat/services/firebase_auth_service.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState()=>_LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;
  AuthBaseService authService = locator<FirebaseAuthService>();
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
    _user = await authService.currentUser();
  }

  void _updateUser(User user){
    setState(() {
      _user = user;
    });
  }
}