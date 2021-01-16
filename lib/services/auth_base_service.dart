
import 'package:live_chat/models/user_model.dart';

abstract class AuthBaseService {
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<bool> signOut();
}