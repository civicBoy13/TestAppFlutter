import 'package:flutter/material.dart';

import 'Screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

