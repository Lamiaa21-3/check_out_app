import 'package:flutter/material.dart';

class ThinkYouBody extends StatelessWidget {
  const ThinkYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height*.2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),

          ),
    Positioned(
    bottom: MediaQuery.of(context).size.height*.2,
    right: -20,
    child: const CircleAvatar(
    backgroundColor: Colors.white,
    ),
    ),
        ],
      ),
    );
  }
}
