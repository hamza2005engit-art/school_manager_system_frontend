import 'package:flutter/material.dart';

class CustomLargeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? width;
  final double height;

  const CustomLargeButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height = 65.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.9,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00ACC1).withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD32F2F),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.logout_rounded,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}