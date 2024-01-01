import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redifly_flutter/src/dashboard/views/report_status.dart';

import '../../../common/core/app_colors.dart';
import '../../../common/core/app_image.dart';
import '../../../common/core/app_text_style.dart';

class ReportingUsers extends StatelessWidget {
  final VoidCallback onTap;

  const ReportingUsers({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Row(
            children: [
              Text(
                "Reporting Users",
                style: AppTextStyle.appTextStyleRegular(context),
              ),
              const Spacer(),
              MaterialButton(
                padding: EdgeInsets.zero,
                color: AppColors.secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    side: const BorderSide(color: Colors.white, width: .36)),
                onPressed: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          CupertinoIcons.plus,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Create a Report ",
                        style: AppTextStyle.appTextStyleSmall(context),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(9),
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 9),
          decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(9)),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(AppImage.technician),
                title: Text(
                  "John Smith",
                  style: AppTextStyle.appTextStyleH1(context),
                ),
                subtitle: Text(
                  "Senior Aircraft Technician",
                  style: AppTextStyle.appTextStyleSmall(context),
                ),
                trailing: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const PastReportScreen()));
                  },
                  child: Text(
                    "View past report >",
                    style: AppTextStyle.appTextStyleSmall(context)
                        .copyWith(color: Colors.blue[300]!),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: ReportStatus(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
