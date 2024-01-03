import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/core/app_colors.dart';
import '../../../common/core/app_text_style.dart';
import '../../../common/enums/app_enum.dart';
import '../../../common/widgets/app_expansion_tile.dart';
import '../../../common/widgets/primary_top_bar.dart';

import '../../calendar/views/cal_screen.dart';
import '../models/bottom_bar_model.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
  }

  final workOrderList = const [
    WorkOrderTileModel("Order Defects", 12),
    WorkOrderTileModel("Deferred MBL Terms", 0),
    WorkOrderTileModel("Deferred Defects", 0),
    WorkOrderTileModel("Briefing Cards", 0),
    WorkOrderTileModel("Cabin Defects", 0),
  ];

  BottomBarMenu bottomBarMenu = BottomBarMenu.dashboard;

  List<BottomBarModel> bottomBarItems = [
    BottomBarModel(
      title: "Dashboard",
      menu: BottomBarMenu.dashboard,
      selectedIconData: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      iconData: const Icon(
        Icons.menu,
        color: Colors.grey,
      ),
    ),
    BottomBarModel(
      title: "Flights",
      menu: BottomBarMenu.flight,
      selectedIconData: const Icon(
        Icons.airplanemode_active,
        color: Colors.white,
      ),
      iconData: const Icon(
        Icons.airplanemode_active,
        color: Colors.grey,
      ),
    ),
    BottomBarModel(
      title: "Aircraft Status",
      menu: BottomBarMenu.aircraft,
      selectedIconData: const Icon(
        Icons.settings,
        color: Colors.white,
      ),
      iconData: const Icon(
        Icons.settings_outlined,
        color: Colors.grey,
      ),
    ),
    BottomBarModel(
      title: "Service",
      menu: BottomBarMenu.service,
      selectedIconData: const Icon(
        Icons.settings,
        color: Colors.white,
      ),
      iconData: const Icon(
        Icons.settings_outlined,
        color: Colors.grey,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // UTC time
    DateTime utcTime = DateTime.now().toUtc();

    // Desired format
    String formattedTime = DateFormat('HH:mm').format(utcTime);
    return LayoutBuilder(
      builder: (context, constraints) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'UTC: $formattedTime',
                        style: AppTextStyle.appTextStyleVerySmall(context),
                      ),
                    ),
                    const PrimaryTopBar(),
                    const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AppExpansionTile(
                        title: "Cabin Defects",
                        trailingIcon: Icons.calendar_month,
                        noRecordsDescription: "No records to display",
                        onCalendarTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CalScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AppExpansionTile(
                        title: "Current Flights",
                        trailingIcon: Icons.calendar_month,
                        onCalendarTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CalScreen(),
                            ),
                          );
                        },
                        noRecordsDescription:
                            "There are currently no sectors in progress",
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AppExpansionTile(
                        title: "Work Orders",
                        trailingIcon: Icons.calendar_month,
                        noRecordsDescription: "No records to display",
                        onCalendarTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CalScreen(),
                            ),
                          );
                        },
                        expandedWidget: SizedBox(
                          child: GridView.builder(
                            padding: const EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 4,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                            ),
                            shrinkWrap: true,
                            itemCount: workOrderList.length,
                            itemBuilder: (context, index) => ListTile(
                              tileColor: AppColors.secondaryColor,
                              title: Text(workOrderList[index].title,
                                  style:
                                      AppTextStyle.appTextStyleSmall(context)),
                              subtitle: Text("(${workOrderList[index].count})",
                                  style: AppTextStyle.appTextStyleVerySmall(
                                      context)),
                              leading: const Icon(
                                Icons.settings,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AppExpansionTile(
                        title: "Maintenance Release",
                        trailingIcon: Icons.calendar_month,
                        noRecordsDescription: "",
                        onCalendarTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CalScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 75,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: ListView.builder(
                itemCount: bottomBarItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      bottomBarMenu = bottomBarItems[index].menu;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: MediaQuery.of(context).size.width /
                            bottomBarItems.length,
                        height: 4,
                        decoration: BoxDecoration(
                          color: bottomBarMenu == bottomBarItems[index].menu
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      bottomBarMenu == bottomBarItems[index].menu
                          ? bottomBarItems[index].selectedIconData
                          : bottomBarItems[index].iconData,
                      Text(
                        bottomBarItems[index].title,
                        style: TextStyle(
                            fontSize: 12,
                            color: bottomBarMenu == bottomBarItems[index].menu
                                ? Colors.white
                                : Colors.grey),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

// showReportDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return ReportDialogView();
//     },
//   );
// }
}

class WorkOrderTileModel {
  final String title;
  final int count;

  const WorkOrderTileModel(this.title, this.count);
}
