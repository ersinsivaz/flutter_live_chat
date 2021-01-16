import 'package:live_chat/models/user_model.dart';
import 'package:live_chat/services/auth_base_service.dart';

class FakeAuthService implements AuthBaseService {
  String userId = "123456789";
  @override
  Future<User> currentUser() async {
    return await Future.value(User(userId: userId));
  }

  @override
  Future<User> signInAnonymously() async  {
    return await Future.delayed(Duration(seconds: 2),()=>User(userId: userId));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

}