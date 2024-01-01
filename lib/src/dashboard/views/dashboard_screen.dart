import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redifly_flutter/src/dashboard/views/add_documents.dart';
import 'package:redifly_flutter/src/dashboard/views/reporting_users.dart';

import '../../../common/core/app_colors.dart';
import '../../../common/core/app_text_style.dart';
import '../../../common/model/app_model.dart';
import '../../../common/widgets/primary_top_bar.dart';
import '../../../common/widgets/secondary_top_bar.dart';

class DashBoardScreen extends StatefulWidget {
  final AppModel appModel;

  const DashBoardScreen({super.key, required this.appModel});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
  }

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
            body: Padding(
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
                  SecondaryTopBar(context: context),
                  const Padding(
                    padding: EdgeInsets.all(9.0),
                    child: Divider(
                      thickness: 1,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  ReportingUsers(onTap: () {
                    // showReportDialog(context);
                  }),
                  const Padding(
                    padding: EdgeInsets.all(9.0),
                    child: Divider(
                      thickness: 1,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  Expanded(
                    // child: AddDocuments(
                    //   documents: widget.appModel.documents,
                    // ),
                  ),
                ],
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
