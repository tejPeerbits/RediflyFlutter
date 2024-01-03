import 'package:flutter/material.dart';
import 'package:redifly_flutter/common/core/app_text_style.dart';

class AppExpansionTile extends StatefulWidget {
  final String title;
  final IconData trailingIcon;
  final Widget? expandedWidget;
  final String noRecordsDescription;
  final VoidCallback onCalendarTap;

  const AppExpansionTile({
    super.key,
    required this.title,
    required this.trailingIcon,
    this.expandedWidget,
    required this.noRecordsDescription,
    required this.onCalendarTap,
  });

  @override
  State<AppExpansionTile> createState() => _AppExpansionTileState();
}

class _AppExpansionTileState extends State<AppExpansionTile> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          height: 3,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyle.appTextStyleH1(context)
                        .copyWith(fontSize: 30),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: widget.onCalendarTap,
              child: Column(
                children: [
                  Icon(
                    widget.trailingIcon,
                    color: Colors.white,
                    size: 40,
                  ),
                  Text(
                    "Calendar",
                    style: AppTextStyle.appTextStyleVerySmall(context),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        if (isExpanded)
          widget.expandedWidget ??
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 15.0,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: widget.noRecordsDescription,
                      style: AppTextStyle.appTextStyleSmall(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
