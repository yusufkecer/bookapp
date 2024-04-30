import 'package:bookapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class AppInit {
  //singleton
  static final AppInit instance = AppInit._internal();
  AppInit._internal();
  factory AppInit() => instance;

  Future<void> firebaseInit() async {
    await Firebase.initializeApp(
      // name: 'BookApp',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
