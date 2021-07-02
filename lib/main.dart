import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_status_screen/screens/home/home.dart';
import 'package:whatsapp_status_screen/screens/login/login.dart';
import 'package:whatsapp_status_screen/screens/register/register.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Whatsapp status screen',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: "/login",
              builder: EasyLoading.init(),
              routes: {
                "/login": (BuildContext context) => Login(),
                "/register": (BuildContext context) => Register(),
                "/": (BuildContext context) => Home(),
              },
            );
          }

          return Container();
        });
  }
}
