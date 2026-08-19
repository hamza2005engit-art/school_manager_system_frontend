import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';


class CustomCardAnnouncements extends StatelessWidget {
  final String advertisement;

  const CustomCardAnnouncements({Key? key, required this.advertisement})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.backcardDark
            : AppColors.bodyFontDark,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${'Announcements'.tr}",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "View All".tr,
                  style: TextStyle(
                    color: Color(0XFF006876),
                    fontSize: AppFonts.bodyLargeSize,
                    fontWeight: AppFonts.bodyLargeWeight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
           ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF007F6D).withOpacity(0.3),
                offset: Offset(-8, 8), // left + bottom
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Card(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.backcardDark
                : AppColors.bodyFontDark,
            child: ListTile(
              title: Text(
                "New Rule",
                style: TextStyle(
                  color: AppColors.primaryLight,
                  fontWeight: AppFonts.bodyLargeWeight,
                  fontSize: AppFonts.bodyLargeSize,
                ),
              ),
              subtitle: Text("${advertisement}"),
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0XFFFFDB5E),
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Icon(Icons.campaign, size: 20, color: Color(0xFFDB2F2F)),
              ),
              trailing: InkWell(
                onTap: () {},
                child: Text(
                  "view Details".tr,
                  style: TextStyle(
                    fontSize: AppFonts.labelSmallSize,
                    fontWeight: AppFonts.labelRegularWeight,
                    color: AppColors.primaryLight,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    )
          // CustomCardAnnouncements(
          //   advertisement: data['advertisement'],
          // ),
        ],
      ),
    );
  
  }
}
