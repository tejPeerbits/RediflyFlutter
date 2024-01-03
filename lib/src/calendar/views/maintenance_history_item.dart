import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/core/app_colors.dart';
import '../../../common/core/app_text_style.dart';
import '../../../common/core/responsive.dart';

class MaintenanceHistoryItem extends StatelessWidget {
  const MaintenanceHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    // if (reportDetails.status.toString().toLowerCase() == "pending") {
    //   color = Colors.orange;
    // }
    // int additionalFieldIndex =
    //     reportDetails.toJson().keys.toList().indexOf("additional_fields");
    // List<String> keys = reportDetails.toJson().keys.toList();
    // List<dynamic> values = reportDetails.toJson().values.toList();

    // keys.removeAt(additionalFieldIndex);
    // values.removeAt(additionalFieldIndex);
    final stopsValue = Responsive.isiPad(context) ? 0.01 : 0.02;
    return Container(
      margin: const EdgeInsets.all(9),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        gradient: LinearGradient(
            stops: [stopsValue, stopsValue],
            colors: [color, AppColors.secondaryColor]),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                children: [
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Responsive.isiPad(context) ? 2 : 1,
                          crossAxisSpacing: 0,
                          mainAxisExtent: 27,
                          mainAxisSpacing: 5),
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 3.r,
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            Text(
                              "keys : ",
                              style: AppTextStyle.appTextStyleSmall(context),
                            ),
                            Text(
                              "values",
                              style: AppTextStyle.appTextStyleSmall(context),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "FAUL-23120112318197",
                style: AppTextStyle.appTextStyleSmall(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
