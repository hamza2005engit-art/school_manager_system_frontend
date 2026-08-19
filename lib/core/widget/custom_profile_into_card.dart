import 'package:flutter/material.dart';
import 'package:student_project1/core/widget/row_card_profie.dart';

class ProfileInfoCard extends StatelessWidget {
  final List<CustomRowProfile> cardProfile;


  const ProfileInfoCard({
    super.key,
    required this.cardProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(24),
        padding: EdgeInsets.all(24),
        height: 285,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Color(0xFFFFFFFF)
        ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: cardProfile,
      ),
    );
  }
}