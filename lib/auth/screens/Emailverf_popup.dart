import 'package:flutter/material.dart';
import 'dart:async';
import 'package:washaa/auth/screens/Profile_Page.dart';

void main() {
  runApp(Emailverf_popup());
}

class Emailverf_popup extends StatefulWidget {
  @override
  _Emailverf_popupState createState() => _Emailverf_popupState();
}

class _Emailverf_popupState extends State<Emailverf_popup> {
  @override
  void initState() {
    super.initState();
    // Schedule the profile page to be pushed after 0.5 seconds
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ProfilePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/icons/Group 18.png'),
        ),
      ),
    );
  }
}
