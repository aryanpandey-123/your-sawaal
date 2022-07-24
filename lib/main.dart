import 'package:YourSawaal/componet/shared_services.dart';
import 'package:YourSawaal/screens/home.dart';
import 'package:YourSawaal/screens/login.dart';
import 'package:YourSawaal/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:YourSawaal/screens/delayscreen.dart';

// Widget defaulthome = delayscreen();
void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Sawaal',
      theme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.white,
              onPrimary: Colors.black,
              secondary: Colors.grey,
              onSecondary: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              background: Colors.grey,
              onBackground: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey),
          fontFamily: "Cairo",
          scaffoldBackgroundColor: Colors.white,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: Colors.black)),
      home: delayscreen(),
      // routes: {
      //   '/login': (context) => login(),
      //   '/home': (context) => nav_bar(),
      //   '/register': (context) => signup()
      // },
    );
  }
}
