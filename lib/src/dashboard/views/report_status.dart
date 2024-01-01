import 'package:flutter/material.dart';

import '../../../common/core/app_text_style.dart';

class ReportStatus extends StatelessWidget {
  const ReportStatus({super.key});

  final int open = 3;
  final int pending = 2;
  final int closed = 7;

  @override
  Widget build(BuildContext context) {
    final List<Color> colorList = [
      Colors.red,
      Colors.green,
      Colors.yellow,
    ];
    int total = open + pending + closed;
    double pendingLeft = open / total;
    double closedLeft = (open + pending) / total;
    print("pendingLeft:$pendingLeft");
    print("closedLeft:$closedLeft");
    print("total:$total");

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Reports Status",
            style: AppTextStyle.appTextStyleSmall(context),
          ),
          SizedBox(
            height: 36,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    height: 15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * pendingLeft - 36,
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.yellow[800],
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * closedLeft - 36,
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 5,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Open: $open",
                style: AppTextStyle.appTextStyleSmall(context),
              ),
              const SizedBox(
                width: 14,
              ),
              const CircleAvatar(
                backgroundColor: Colors.yellow,
                radius: 5,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Pending: $pending",
                style: AppTextStyle.appTextStyleSmall(context),
              ),
              const SizedBox(
                width: 14,
              ),
              const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 5,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Closed: $closed",
                style: AppTextStyle.appTextStyleSmall(context),
              )
            ],
          )
        ],
      ),
    );
  }
}
