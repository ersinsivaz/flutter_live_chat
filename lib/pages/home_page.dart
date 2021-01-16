import 'package:flutter/material.dart';
import 'package:live_chat/models/user_model.dart';
import 'package:live_chat/viewModels/user_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  final User user;

  HomePage({Key key,  @required this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context)  {
     
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Text("Çıkış Yap",style: TextStyle(color: Colors.white),),
            onPressed: () => _cikisYap(context),
                      ),
                    ],
                    title: Text("Anasayfa"),
                  ),
                  body: Center(
                    child: Text("Hoşgeldiniz: ${user.userId}"),
                  ),
                );
              }
            
 Future<bool> _cikisYap(BuildContext context) async {
   final _userModel = Provider.of<UserModel>(context);
    bool sonuc = await _userModel.signOut();
    return sonuc;
}             
}
