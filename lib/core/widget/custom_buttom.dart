import 'package:flutter/material.dart';
import 'package:student_project1/core/constants/app_numbers.dart';
import 'package:student_project1/core/theme/app_colors.dart';
import 'package:student_project1/core/theme/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppNumbers.ButtonRadius),
        gradient: LinearGradient(
          colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary],
        ),
        boxShadow: const [BoxShadow(blurRadius: 4,offset: Offset(0, 6),color: AppColors.secondryLight)]
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppNumbers.ButtonRadius),
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: AppTextStyle.onMainButtonLight),
            const SizedBox(width: AppNumbers.SpaceBetween2),
            Icon(icon,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
