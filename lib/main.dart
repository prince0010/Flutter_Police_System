import 'package:flutter/material.dart';
import 'package:policesystem/pages/home.dart';
import 'package:policesystem/pages/login.dart';
import 'package:policesystem/pages/logins.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login ',
      debugShowCheckedModeBanner: false,
      home: CheckAuth(),
      darkTheme: ThemeData(
          // brightness: Brightness.dark,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent)),
      themeMode: ThemeMode.dark,
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      // child = Home();
    } else {
      // child = Login();
      child = HomePage();
    }

    return Scaffold(
        // body: child,
        // body: HomePage(),
        );
  }
}
