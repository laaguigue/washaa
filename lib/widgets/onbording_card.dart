import 'package:flutter/material.dart';

class OnbordingCard extends StatelessWidget {
  final String image;
  final String secondImage;

  const OnbordingCard({
    super.key,
    required this.image,
    required this.secondImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              30.0,
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset(secondImage, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
