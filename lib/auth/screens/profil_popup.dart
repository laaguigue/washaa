import 'package:flutter/material.dart';
import 'dart:async';
import 'package:washaa/auth/screens/Profile_Page.dart';

void main() {
  runApp(profil_popup());
}

class profil_popup extends StatefulWidget {
  @override
  _profil_popupState createState() => _profil_popupState();
}

class _profil_popupState extends State<profil_popup> {
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
          child: Image.asset('assets/icons/card.png'),
        ),
      ),
    );
  }
}
