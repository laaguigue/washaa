import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:washaa/auth/screens/profil_popup.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('hade lcode makhadamach khouya : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.blue),
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
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'Tell us more about you..',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.0),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade300,
              child: _image == null
                  ? IconButton(
                      icon: Icon(Icons.person_add),
                      onPressed: _pickImage,
                    )
                  : ClipOval(
                      child: Image.file(
                        _image!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
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
                prefixText: '+212   ', // adjust the prefix as needed
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profil_popup()),
                );
              },
              child: Text(
                'Continue',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
