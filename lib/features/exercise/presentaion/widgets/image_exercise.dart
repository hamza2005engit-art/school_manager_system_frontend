import 'package:flutter/material.dart';

class ImageExercise extends StatelessWidget {
  const ImageExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/exercise.jpg",
            width: 408,
            height: 128,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 5,
            //right: 10,
            child: Image.asset(
              "assets/images/exercise_text.png",
              width: 408,
              height: 128,
            ),
          ),
        ],
      ),
    );
  }

}