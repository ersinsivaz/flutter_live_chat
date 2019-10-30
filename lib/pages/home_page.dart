import 'package:flutter/material.dart';
import 'package:live_chat/locator.dart';
import 'package:live_chat/models/user_model.dart';
import 'package:live_chat/services/firebase_auth_service.dart';

class HomePage extends StatelessWidget {

  final VoidCallback onSignOut;
  
  final User user;

  HomePage({Key key,  @required this.user ,@required this.onSignOut}) : super(key: key);
  final authService = locator<FirebaseAuthService>();
  @override
  Widget build(BuildContext context)  {
    
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
                    child: Text("Hoşgeldiniz: ${user.userId}"),
                  ),
                );
              }
            
 Future<bool> _cikisYap() async {
    bool sonuc = await authService.signOut();
    onSignOut();
    return sonuc;
}             
}
