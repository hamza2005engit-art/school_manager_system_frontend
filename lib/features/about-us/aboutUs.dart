import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/core/theme/app_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us".tr,
          style: TextStyle(color: Colors.white,
              fontWeight: AppFonts.labelRegularWeight,
              fontSize: AppFonts.headRegularSize),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon:Icon(Icons.arrow_back,size: 30),),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 65.5,),
             Image.asset(
                  "assets/images/about.png",
                height: 440,width: double.infinity,fit: BoxFit.cover,
              ),
            Container(
              margin: EdgeInsets.only(
                top: 50,
                left: 49
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Us".tr,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '''
نظام School Management هو تطبيق مصمم لتسهيل إدارة العملية التعليمية بين الطلاب والمعلمين والإدارة في مكان واحد.

يهدف التطبيق إلى تحسين التواصل وتنظيم المعلومات بشكل فعال وسهل الاستخدام، مما يساعد على توفير تجربة تعليمية أفضل وأكثر تنظيمًا.
    ''',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}