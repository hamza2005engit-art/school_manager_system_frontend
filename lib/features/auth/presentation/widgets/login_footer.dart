import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/routes/app_routes.dart';
import '../../../../core/widget/custom_link.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.4),
            width: 2.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have account? ',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          CustomLink(text: "Register",onPressed: (){
            Get.offAllNamed(Routes.REGISTER1);
          }),
        ],
      ),
    );
  }
}