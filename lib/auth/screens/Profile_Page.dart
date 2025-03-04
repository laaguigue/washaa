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
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _cityFocus = FocusNode();

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
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _cityFocus.dispose();
    super.dispose();
  }

  TextField _buildTextField({
    required String label,
    required String hint,
    required TextInputType keyboardType,
    TextInputAction textInputAction = TextInputAction.next,
    FocusNode? currentFocus,
    FocusNode? nextFocus,
  }) {
    return TextField(
      focusNode: currentFocus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSubmitted: (value) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        } else {
          currentFocus?.unfocus();
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isKeyboardVisible =
        MediaQuery.of(context).viewInsets.bottom != 0;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Skip', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isPortrait ? 16.0 : 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (!isKeyboardVisible || isPortrait)
                Text('Hello Ayoub laaguigue!',
                    style: TextStyle(fontSize: 24.0)),
              if (!isKeyboardVisible || isPortrait)
                Text('Tell us more about you..',
                    style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 24.0),
              CircleAvatar(
                radius:
                    screenHeight * 0.06, // Responsive based on screen height
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: _image == null
                    ? IconButton(
                        icon: Icon(Icons.person_add),
                        onPressed: _pickImage,
                      )
                    : ClipOval(
                        child: Image.file(
                          _image!,
                          width: screenHeight * 0.12, // Responsive
                          height: screenHeight * 0.12, // Responsive
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              SizedBox(height: 24.0),
              _buildTextField(
                label: 'Full Name',
                hint: 'Enter your full name',
                keyboardType: TextInputType.name,
                currentFocus: _nameFocus,
                nextFocus: _phoneFocus,
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                label: 'Phone Number',
                hint: 'Phone number',
                keyboardType: TextInputType.phone,
                currentFocus: _phoneFocus,
                nextFocus: _cityFocus,
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                label: 'City',
                hint: 'City',
                keyboardType: TextInputType.text,
                currentFocus: _cityFocus,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 24.0),
              if (!isKeyboardVisible || isPortrait)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 20.0), // Increase padding
                    minimumSize: Size(200, 60), // Set a minimum size
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profil_popup()),
                    );
                  },
                  child: Text(
                    'Continue', // command line.
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
