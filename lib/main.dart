import 'package:beepzz/screens/chat_screen.dart';
import 'package:beepzz/screens/login_page.dart';
import 'package:beepzz/screens/registration_page.dart';
import 'package:beepzz/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyBBou60y2iRc6rTLn1I0lfJW-0zfmQD2gU',
          appId: '1:735960474643:android:8fb452a6be11b544e40be6',
          messagingSenderId: '735960474643',
          projectId: 'beepzz-a8509'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}
