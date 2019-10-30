import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_chat/models/user_model.dart';
import 'package:live_chat/services/auth_base_service.dart';

class FirebaseAuthService implements AuthBaseService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User> currentUser() async {
    try{
      FirebaseUser user = await _firebaseAuth.currentUser();
      return _userFromFirebaseUser(user);
    } catch(e) {
      print("Hata currentUser():" + e.toString());
      return null;
    }
  }

  @override
  Future<User> signInAnonymously() async {
    try{
      AuthResult result = await _firebaseAuth.signInAnonymously();
      return _userFromFirebaseUser(result.user);
    } catch(e){
      print("Hata currentUser():" + e.toString());
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try{
      await _firebaseAuth.signOut();
      return true;
    } catch(e){
      print("Hata signOut():" + e.toString());
      return false;
    }
    
  }

  User _userFromFirebaseUser(FirebaseUser user){
    if(user == null) return null;

    return User(userId: user.uid);
  }

}