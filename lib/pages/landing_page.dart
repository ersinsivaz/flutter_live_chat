import 'package:flutter/material.dart';
import 'package:live_chat/models/user_model.dart';
import 'package:live_chat/pages/home_page.dart';
import 'package:live_chat/pages/signin_page.dart';
import 'package:live_chat/services/auth_base_service.dart';

class LandingPage extends StatefulWidget {
  final AuthBaseService authService;

  const LandingPage({Key key, @required this.authService}) : super(key: key);
  @override
  _LandingPageState createState()=>_LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  @override
  void initState() {
    super.initState();
    _checkUser();
  }
  @override
  Widget build(BuildContext context) {
    if(_user == null){
      return SigninPage(
        authService: widget.authService,
        onSignIn: (user){
          _updateUser(user);
        },
      );
    } else {
      return HomePage(
        user: _user,
        authService: widget.authService,
        onSignOut: (){
          _updateUser(null);
        },
        );
    }
  }

  Future<void> _checkUser() async {
    _user = await widget.authService.currentUser();
  }

  void _updateUser(User user){
    setState(() {
      _user = user;
    });
  }
}