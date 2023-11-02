import 'package:firebasenewproj/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//import 'happy_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(clientId: 'Your client ID here'),
  ]);
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessageReceived);
  runApp(const MainApp());
}

Future _firebaseBackgroundMessageReceived(RemoteMessage message) async {
  print("Notification: ${message.notification?.title} - ${message.notification?.body}");
  FirebaseMessaging messaging = FirebaseMessaging.instance;

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationScreen(),
    );
  }
}
