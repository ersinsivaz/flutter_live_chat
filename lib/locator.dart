import 'package:get_it/get_it.dart';
import 'package:live_chat/services/firebase_auth_service.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(()=>FirebaseAuthService());
}