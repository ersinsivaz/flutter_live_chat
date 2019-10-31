import 'package:flutter/material.dart';
import 'package:live_chat/pages/home_page.dart';
import 'package:live_chat/pages/signin_page.dart';
import 'package:live_chat/viewModels/user_view_model.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'signin_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _userModel = Provider.of<UserModel>(context);

    if(_userModel.state == ViewState.Idle){
      if(_userModel.user == null){
        return SigninPage();
      }else {
        return HomePage(user: _userModel.user,);
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if(_userModel.user == null){
      return SigninPage();
    } else {
      return HomePage(
        user: _userModel.user,
        );
    }
  }

  
}