
import 'package:flutter/material.dart';
import 'package:live_chat/widgets/common/social_login_button.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Lovers"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Oturum Açın",textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),
            ),
            SizedBox(height: 8,),
            SocialLoginButton(
              buttonText: "Gmail ile oturum aç",
              buttonColor: Colors.white,
              textColor: Colors.black87,
              buttonIcon: Image.asset("images/gmail-logo.jpg"),
              onPressed: () {},
            ),
            SocialLoginButton(
              buttonColor: Color(0xFF334D92),
              buttonText: "Facebook ile oturum aç",
              textColor: Colors.white,
              buttonIcon: Image.asset("images/gmail-logo.jpg"),
              radius: 16.0,
              onPressed: () {},
            ),
            SocialLoginButton(
              buttonText: "Email ve Şifre ile giriş yap",
              buttonColor: Colors.red,
              textColor: Colors.white,
              buttonIcon: Icon(Icons.mail,color: Colors.white,),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

}