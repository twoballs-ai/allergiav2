import 'package:allergia/authentication/auth.dart';
import 'package:allergia/authentication/register.dart';
import 'package:allergia/landing.dart';
import 'package:allergia/screens/home_screen.dart';
import 'package:allergia/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:allergia/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Landing(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/wrapper': (context) => Wrapper(),
      },
    );
  }
}
