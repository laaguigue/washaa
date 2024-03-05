import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State <OnbordingPage> {
  static final PageController _pageController = PageController(initialPage: )
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding: const EdgeInsets.symmetric(
        vertical:50.0,
        ),
      child: Column(
        children: [
          SmoothPageIndicator(controller: controller, count: count)
        ],
        ),
      ),
    );
  }
}