import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_colors.dart';
import '../core/app_text_style.dart';

class SecondaryTopBar extends StatelessWidget {
  const SecondaryTopBar({super.key, required this.context});

  final BuildContext context;

  Widget container(String title, String value) {
    return Container(
      padding: EdgeInsets.only(left: 9.w, right: 14.w, top: 5.h, bottom: 5.h),
      margin: const EdgeInsets.all(5),
      constraints: BoxConstraints(minHeight: 45.h, maxHeight: 45.h),
      // height: 45,
      // height: 54,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(5.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyle.appTextStyleRegular(context),
          ),
          Text(
            value,
            style: AppTextStyle.appTextStyleSmall(context)
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = constraints.maxWidth;
      if (screenWidth < 600) {
        // Mobile layout: Display two widgets in a row
        return SizedBox(
          height: 110.h,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: container("Reports Submitted", "12")),
                  Expanded(child: container("Last Report", "10-08-2023 08:56")),
                ],
              ),
              Expanded(child: container("Active Since", "14-06-2023")),
            ],
          ),
        );
      } else {
        return Row(
          children: [
            Expanded(child: container("Reports Submitted", "12")),
            Expanded(child: container("Last Report", "10-08-2023 08:56")),
            Expanded(child: container("Active Since", "14-06-2023")),
          ],
        );
      }
    });
  }
}
