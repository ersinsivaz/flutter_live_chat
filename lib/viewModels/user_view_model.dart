import 'package:flutter/cupertino.dart';
import 'package:live_chat/locator.dart';
import 'package:live_chat/models/user_model.dart';
import 'package:live_chat/repositories/user_respository.dart';
import 'package:live_chat/services/auth_base_service.dart';

enum ViewState {Idle, Busy}

class UserModel with ChangeNotifier implements AuthBaseService {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  User _user;

  ViewState get state => _state;

  set state(ViewState value){
    _state = value;
    notifyListeners();
  }

  @override
  Future<User> currentUser() async {
    try{
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return _user;
    } catch(e){
      debugPrint("UserMOdel current user hata : " + e.toString());
      return null;
    } finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInAnonymously() async {
    try{
      state = ViewState.Busy;
      _user = await _userRepository.signInAnonymously();
      return _user;
    } catch(e){
      debugPrint("UserMOdel signInAnonymously user hata : " + e.toString());
      return null;
    } finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try{
      state = ViewState.Busy;
      return await _userRepository.signOut();
  
    } catch(e){
      debugPrint("UserMOdel signOut user hata : " + e.toString());
      return null;
    } finally{
      state = ViewState.Idle;
    }
  }
}