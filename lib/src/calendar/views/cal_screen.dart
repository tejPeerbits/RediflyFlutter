import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redifly_flutter/common/core/app_colors.dart';
import 'package:redifly_flutter/src/calendar/views/maintenance_history_item.dart';

import '../../../common/core/app_text_style.dart';
import '../../../common/enums/app_enum.dart';
import '../models/top_bar_model.dart';

class CalScreen extends StatefulWidget {
  const CalScreen({super.key});

  @override
  State<CalScreen> createState() => _CalScreenState();
}

class _CalScreenState extends State<CalScreen> {
  TopBarMenu topBarMenu = TopBarMenu.maintenanceHistory;

  List<TopBarModel> topBarItems = [
    TopBarModel(
      title: "Flight History",
      selectedIconData: const Icon(
        Icons.airplanemode_active,
        color: Colors.white,
      ),
      menu: TopBarMenu.flightHistory,
      iconData: const Icon(
        Icons.airplanemode_active,
        color: Colors.grey,
      ),
    ),
    TopBarModel(
      title: "Maintenance History",
      selectedIconData: const Icon(
        Icons.settings,
        color: Colors.white,
      ),
      menu: TopBarMenu.maintenanceHistory,
      iconData: const Icon(
        Icons.settings_outlined,
        color: Colors.grey,
      ),
    ),
    TopBarModel(
      title: "Service Details",
      selectedIconData: const Icon(
        Icons.oil_barrel,
        color: Colors.white,
      ),
      menu: TopBarMenu.serviceDetails,
      iconData: const Icon(
        Icons.oil_barrel_outlined,
        color: Colors.grey,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///dashboard button
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          side: const BorderSide(color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Dashboard',
                            style: AppTextStyle.appTextStyleSmall(context),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    /// Systemtest Button
                    Row(
                      children: [
                        MaterialButton(
                          color: AppColors.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              4.r,
                            ),
                            side: const BorderSide(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'E290 |System Test',
                            style: AppTextStyle.appTextStyleSmall(context),
                          ),
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        MaterialButton(
                          color: AppColors.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              4.r,
                            ),
                            side: const BorderSide(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'UTC: 06:10',
                            style: AppTextStyle.appTextStyleSmall(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    /// menu
                    Container(
                      height: 75,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                      ),
                      child: ListView.builder(
                        itemCount: topBarItems.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            setState(() {
                              topBarMenu = topBarItems[index].menu;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 6,
                              ),
                              topBarMenu == topBarItems[index].menu
                                  ? topBarItems[index].selectedIconData
                                  : topBarItems[index].iconData,
                              Text(
                                topBarItems[index].title,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: topBarMenu == topBarItems[index].menu
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: MediaQuery.of(context).size.width /
                                    topBarItems.length,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: topBarMenu == topBarItems[index].menu
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),

                    if (topBarMenu == topBarItems[1].menu)
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  border: Border.all(color: Colors.white)),
                              padding: const EdgeInsets.all(5),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "2024-01-02",
                              style: AppTextStyle.appTextStyleH2(context),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  border: Border.all(color: Colors.white)),
                              padding: const EdgeInsets.all(5),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                Text(
                                  "Month View",
                                  style: AppTextStyle.appTextStyleVerySmall(
                                      context),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                    if (topBarMenu == topBarItems[1].menu)
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) =>
                            const MaintenanceHistoryItem(),
                      )

                    ///
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
