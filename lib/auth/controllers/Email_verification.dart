import 'package:flutter/material.dart';

void main() {
  runApp(Email_verification());
}

class Email_verification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmailVerificationScreen(),
    );
  }
}

class EmailVerificationScreen extends StatefulWidget {
  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  // ignore: unused_field
  TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Email Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Please enter your verification code',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'We sent 06 digit code to your Email:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Ayoublaaguigue@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 81, 160, 235),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Assuming you have a custom widget to handle the code input
            _buildCodeInput(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement verification logic
              },
              child: Text('Verify', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 81, 160, 235),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '00:34',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "Note: Can't find it? please check your spam folder",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20.0),
            Text(
              "Didn't receive any code ?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            TextButton(
              onPressed: () {
                // Implement resend logic
              },
              child: Text('Resend code in: 60Sec',
                  style: TextStyle(color: Color.fromARGB(255, 81, 160, 235))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(
        6,
        (index) => Container(
          width: 40,
          height: 50,
          alignment: Alignment.center,
          child: TextField(
            controller: TextEditingController(),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
