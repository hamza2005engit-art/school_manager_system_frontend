import 'package:flutter/material.dart';

class TotalFeesCard extends StatelessWidget {

  final String title;
  final int amount;

  const TotalFeesCard({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 170,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 20,
      ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),

          gradient: const LinearGradient(
            colors: [
              Color(0xFF123C73),
              Color(0xFF0A2342),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          boxShadow: [

            /// Shadow الأساسي
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),

            /// Glow أخضر مثل الصورة
            BoxShadow(
              color: const Color(0xFF00FFC6).withOpacity(0.35),
              blurRadius: 20,
              spreadRadius: 1,
            ),

          ],
        ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// LEFT SIDE
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 18),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    amount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 8),

                  const Text(
                    "\$",
                    style: TextStyle(
                      color: Color(0xFF39FF14),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// RIGHT SIDE ICON
          Icon(
            Icons.account_balance_wallet_rounded,
            size: 120,
            color: Colors.white.withOpacity(0.18),
          ),
        ],
      ),
    );
  }
}