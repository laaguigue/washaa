import 'package:flutter/material.dart';
import 'package:washaa/auth/controllers/Email_verification.dart';

void main() {
  runApp(Emailverf_popup());
}

class Emailverf_popup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmailVerificationScreen(),
    );
  }
}