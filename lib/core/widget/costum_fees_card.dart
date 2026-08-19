import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class FeesCard extends StatefulWidget {



  final int total;
  final int paid;
  final int total_fess;
  final int total_remaining;
  final IconData icon;
  final double?width;
  final double?height;

  const FeesCard({
    super.key,
    required this.total,
    required this.paid,
    required this.icon,
    required this.total_fess,
    required this.total_remaining,
    this.height,
    this.width,
  });

  @override
  State<FeesCard> createState() => _ExercisesCardState();
}
class _ExercisesCardState extends State<FeesCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {

    double progress = widget.paid / widget.total;

    return Card(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.backcardDark
          : Colors.white,
      elevation: 10,
      shadowColor: const Color(0x2200D4B6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Top Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.secondryDark
                        : AppColors.secondryLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    widget.icon,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.backcardDark
                        : AppColors.contonergredLight,
                    size: 28,
                  ),
                ),

                /// Title
                Text(
                  "School Fees",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// Paid & Remaining
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "Paid: ${widget.paid} \$",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),

                Text(
                  "Remaining: ${widget.total_remaining} \$",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation(
                  Color(0xFF00BFA6),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Total
            Text(
              "Total: ${widget.total} \$",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
