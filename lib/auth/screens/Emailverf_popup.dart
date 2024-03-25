import 'package:flutter/material.dart';
import 'dart:async'; // Import dart:async for Future.delayed

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

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black, // adjust the color to match your design
        ),
        backgroundColor: Colors.white, // Color for AppBar
        elevation: 0, // Remove shadow
        actions: [
          TextButton(
            onPressed: () {
              // Define the action for the skip button
            },
            child: Text(
              'Skip',
              style: TextStyle(
                  color: Colors.blue), // adjust the color to match your design
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello Ayoub laaguigue!',
              style: TextStyle(
                  fontSize: 24.0), // adjust the styling to match your design
            ),
            Text(
              'Tell us more about you..',
              style: TextStyle(
                  fontSize: 16.0), // adjust the styling to match your design
            ),
            SizedBox(height: 24.0),
            CircleAvatar(
              radius: 40, // adjust the size to match your design
              backgroundColor: Colors.grey.shade300,
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Define the action for the add profile picture button
                },
              ),
            ),
            SizedBox(height: 24.0),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(), // Adds a border around the TextField
                labelText: 'Full Name',
                hintText: 'Enter your username',
                labelStyle: TextStyle(
                  fontSize: 16.0, // Adjusts the font size of the label
                  color: Colors.grey[800], // Changes the label text color
                ),
                hintStyle: TextStyle(
                  color: Colors.grey[500], // Changes the hint text color
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(), // Adds a border around the TextField
                labelText: 'Phone number',
                hintText: 'Phone number',
                prefixText: '+212 ', // adjust the prefix as needed
                labelStyle: TextStyle(
                  fontSize: 16.0, // Adjusts the font size of the label
                  color: Colors.grey[800], // Changes the label text color
                ),
                hintStyle: TextStyle(
                  color: Colors.grey[500], // Changes the hint text color
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(), // Adds a border around the TextField
                labelText: 'City',
                hintText: 'City',
                labelStyle: TextStyle(
                  fontSize: 16.0, // Adjusts the font size of the label
                  color: Colors.grey[800], // Changes the label text color
                ),
                hintStyle: TextStyle(
                  color: Colors.grey[500], // Changes the hint text color
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // foreground (text) color
              ),
              onPressed: () {
                // Define what happens when the button is pressed
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
