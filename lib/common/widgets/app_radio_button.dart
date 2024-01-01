import 'package:flutter/material.dart';

import '../core/app_text_style.dart';
import '../core/responsive.dart';

class AppRadioButton extends StatefulWidget {
  final List<String> gridList;
  final String fieldName;
  final int valueIndex;
  final Function(int?)? onChanged;

  const AppRadioButton({
    super.key,
    required this.gridList,
    required this.fieldName,
    required this.valueIndex,
    required this.onChanged
  });

  @override
  State<AppRadioButton> createState() => _AppRadioButtonState();
}

class _AppRadioButtonState extends State<AppRadioButton> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.valueIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.fieldName,
          style: AppTextStyle.appTextStyleH3(context),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isiPad(context) ? 2:1,
            childAspectRatio: Responsive.isiPad(context) ? 5 : 3,
          ),
          itemCount: widget.gridList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Radio(
                value: index,
                fillColor: const MaterialStatePropertyAll(Colors.white),
                groupValue: selectedIndex,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    selectedIndex = value;
                  });
                  if(widget.onChanged!=null){
                  widget.onChanged!(value);
                  }
                },
              ),
              title: Text(
                widget.gridList[index],
                style: AppTextStyle.appTextStyleSmall(context),
              ),
            );
          },
        ),
      ],
    );
  }
}
