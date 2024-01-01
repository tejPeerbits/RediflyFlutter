import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_image.dart';
import '../core/app_text_style.dart';

class PrimaryTopBar extends StatelessWidget {
  const PrimaryTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              AppImage.logoDark,
              height: 63.h,
              width: 63.w,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                "John Smith",
                style: AppTextStyle.appTextStyleH1(context),
              ),
              Text("Senior Aircraft Technician",
                  style: AppTextStyle.appTextStyleSmall(context)),
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.cloud_done_sharp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Last sync\n15:09",
                        style: AppTextStyle.appTextStyleVerySmall(context),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(9.0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
