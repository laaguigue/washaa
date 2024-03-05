import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart'; // Ensure this file exists and contains an OnboardingPage widget

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();
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
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const OnboardingPage(), // Use OnboardingPage here
    );
  }
}

// Assuming OnboardingPage is a stateless widget like this:
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is the onboarding page."),
      ),
    );
  }
}
