import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washaa/auth/screens/signup_page.dart';
import 'package:washaa/pages/onbording_page.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const Washaa());
}

class Washaa extends StatelessWidget {
  const Washaa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Washaa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 67, 124, 222),
        ),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: _checkIfSeen(),
        builder: (context, snapshot) {
          // Check if future is resolved and data is false, meaning onboarding has not been seen
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == false) {
            // Remove the splash screen when the Future is complete
            FlutterNativeSplash.remove();
            return const OnbordingPage(); // Show OnboardingPage if not seen
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == true) {
            // Remove the splash screen when the Future is complete
            FlutterNativeSplash.remove();
            return SignupPage('s'); // Skip OnboardingPage if already seen
          } else {
            // Return an empty container while waiting
            return Container(color: Colors.white);
          }
        },
      ),
    );
  }

  Future<bool> _checkIfSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('seen') ?? false;
  }
}

// Implement HomePage as per your app's requirements.
