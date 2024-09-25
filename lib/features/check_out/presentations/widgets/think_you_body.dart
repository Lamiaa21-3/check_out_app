
import 'package:flutter/material.dart';

class ThinkYouBody extends StatelessWidget {
  const ThinkYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            decoration: BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
