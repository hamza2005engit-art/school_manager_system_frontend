import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int totalPages;    // عدد الصفحات الكلي
  final int currentPage;   // الصفحة الحالية

  const PageIndicator({
    super.key,
    required this.totalPages,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        totalPages,
            (index) => Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 15,
            decoration: BoxDecoration(
              color: index <= currentPage
                  ? Theme.of(context).primaryColor // ملون للصفحة الحالية وما قبلها
                  : Colors.grey.shade300,   // رمادي للصفحات القادمة
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ); // مؤقت
  }
}