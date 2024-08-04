import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:washaa/auth/screens/signup_page.dart';
import 'package:washaa/widgets/onbording_card.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: [
                      OnbordingCard(
                        image: "assets/fonts/welcom.png",
                        secondImage: "assets/images/4.png",
                      ),
                      OnbordingCard(
                        image: "assets/fonts/Discover.png",
                        secondImage: "assets/images/5.png",
                      ),
                      OnbordingCard(
                        image: "assets/fonts/Effortl.png",
                        secondImage: "assets/images/3.png",
                      ),
                      // Add more OnbordingCards here as needed
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor:
                          Color.fromARGB(255, 44, 107, 226), // Active dot color
                      dotColor: Colors.grey.shade400, // Inactive dot color
                    ), // You can choose and customize the effect you want
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all<Size>(
                          Size(150, 40)), // minWidth and height
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Color(0xFF1692FC)), // Button color
                      foregroundColor: WidgetStateProperty.all<Color>(
                          Colors.white), // Text color
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ))),
                  child: Text('Register'),
                  onPressed: () {
                    // Define what happens when the button is pressed
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all<Size>(Size(150, 40)),
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Color(0xFFDAEEFC)), // Button color
                      foregroundColor: WidgetStateProperty.all<Color>(
                          Color(0xFF1692FC)), // Text color
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 44, 107, 226))))),
                  child: Text('Sign Up'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignupPage('s')));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFDAEEFC),
    );
  }
}
