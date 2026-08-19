import 'package:flutter/material.dart';
import '../../../../core/theme/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color colorButton;
  const CustomButton({super.key, required this.text, required this.colorButton});

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Container(
        height: 51,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: colorButton,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "${text}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: AppFonts.bodyLargeWeight,
                  fontSize: AppFonts.bodyRegularSize,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.send,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

}