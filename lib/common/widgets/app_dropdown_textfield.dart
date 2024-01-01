import 'package:flutter/material.dart';

import '../core/app_text_style.dart';
import '../core/responsive.dart';

enum DropDownType { primary, secondary }

class AppDropDownTextField extends StatefulWidget {
  final String? hintText;
  final String textFieldName;
  final DropDownType? dropDownType;
  final String? value;
  final List<String>? dropDownItemsList;
  final bool isRequired;
  final void Function(String?) onChanged;

  const AppDropDownTextField({
    super.key,
    this.dropDownType,
    this.hintText,
    required this.textFieldName,
    this.value,
    this.dropDownItemsList,
    required this.isRequired,
    required this.onChanged,
  });

  @override
  State<AppDropDownTextField> createState() => _AppDropDownTextFieldState();
}

class _AppDropDownTextFieldState extends State<AppDropDownTextField> {
  String value = "";

  @override
  void initState() {
    super.initState();
    value = widget.value!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final stopsValue = Responsive.isiPad(context) ? 0.01 : 0.02;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.textFieldName,
          style: AppTextStyle.appTextStyleH3(context),
        ),
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: widget.dropDownType != DropDownType.secondary
                ? Colors.white
                : Colors.transparent,
            border: widget.dropDownType == DropDownType.secondary
                ? Border.all(color: Colors.white)
                : null,
            gradient: widget.dropDownType != DropDownType.secondary
                ? widget.isRequired
                    ? LinearGradient(
                        stops: [stopsValue, stopsValue],
                        colors: const [Colors.red, Colors.white],
                      )
                    : null
                : null,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: value,
              style: AppTextStyle.appTextStyleSmall(context).copyWith(
                  color: widget.dropDownType == DropDownType.secondary
                      ? Colors.white
                      : Colors.black),
              items: widget.dropDownItemsList!
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                widget.onChanged(val);
                print("dropdown:$val");
                setState(() {
                  if (val == null) return;
                  value = val;
                });
              },
              hint: Text(
                widget.dropDownType == DropDownType.secondary
                    ? ""
                    : "Please select",
              ),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: widget.dropDownType == DropDownType.secondary
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
