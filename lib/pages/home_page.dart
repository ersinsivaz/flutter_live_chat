import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;
  final VoidCallback onSignOut;

  HomePage({Key key, this.user, @required this.onSignOut}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Text("Çıkış Yap",style: TextStyle(color: Colors.white),),
            onPressed: _cikisYap,
                      ),
                    ],
                    title: Text("Anasayfa"),
                  ),
                  body: Center(
                    child: Text("Hoşgeldiniz: ${user.uid}"),
                  ),
                );
              }
            
 Future<void> _cikisYap() async {
    await FirebaseAuth.instance.signOut();
    onSignOut();
}             
}
