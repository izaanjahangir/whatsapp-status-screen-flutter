import 'package:flutter/material.dart';
import 'package:whatsapp_status_screen/screens/home/home.dart';
import 'package:whatsapp_status_screen/screens/login/login.dart';
import 'package:whatsapp_status_screen/screens/register/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp status screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      routes: {
        "/login": (BuildContext context) => Login(),
        "/register": (BuildContext context) => Register(),
        "/": (BuildContext context) => Home(),
      },
    );
  }
}
