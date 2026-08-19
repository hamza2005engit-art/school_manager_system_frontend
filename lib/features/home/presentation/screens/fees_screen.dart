
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/core/theme/app_fonts.dart';

import '../../../../core/widget/costum_fees_card.dart';
import '../../../../core/widget/coustum_totalfees_card.dart';



class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});


  @override
  State<FeesScreen> createState() => _FeesScreenState();
}
class _FeesScreenState extends State<FeesScreen>
    with SingleTickerProviderStateMixin {




  @override
  Widget build(BuildContext context) {


    return Scaffold(

        appBar: AppBar(
          title: Text(
            "Fees",
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


        body:Padding(
            padding: const EdgeInsets.all(7),
            child: Column(
children: [
  TotalFeesCard(
    title: "TOTAL FESS",
    amount: 4000,
  ),
  SizedBox(height: 20,),
  FeesCard(
    total: 3000,
    paid: 1000,
    total_remaining: 2000,
    total_fess: 3000,
    icon: Icons.school,
  )
],
            )
        )

    );
  }}


