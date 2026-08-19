import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCard extends StatelessWidget {
  final XFile? image;        // الصورة المختارة
  final VoidCallback onTap;  // عند الضغط
  final double? width;
  final double? height;
  final String label;        // النص قبل الاختيار

  const ImagePickerCard({
    super.key,
    required this.onTap,
    required this.label,
    this.image,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width ?? MediaQuery.of(context).size.width*0.70,
        height: height ?? MediaQuery.of(context).size.width*0.24,
        decoration: BoxDecoration(
          color: image != null
              ? Colors.transparent
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: image != null
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
            width: image != null ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        // ... داخل دالة build في ملف costum_image_continer.dart

        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: image != null
              ? Image.file(
            File(image!.path),
            fit: BoxFit.cover,
            width: double.infinity, // سيأخذ حجم الـ AnimatedContainer
            height: double.infinity,
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_photo_alternate_outlined,
                color: Colors.grey,
                size: 42,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
// ...,
      ),
    );
  }
}