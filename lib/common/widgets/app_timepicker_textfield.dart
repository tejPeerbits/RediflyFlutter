import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redifly_flutter/common/widgets/text_field_wrapper.dart';

import '../core/app_text_style.dart';

class AppTimePickerTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? textFieldName;
  final DateTime? initialDate;
  final Function(DateTime value) selectedValue;
  final bool isRequired;

  const AppTimePickerTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.textFieldName,
      this.initialDate,
      required this.selectedValue,
      required this.isRequired});

  @override
  State<AppTimePickerTextField> createState() => _AppTimePickerTextFieldState();
}

class _AppTimePickerTextFieldState extends State<AppTimePickerTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.textFieldName ?? "",
          style: AppTextStyle.appTextStyleH3(context),
        ),
        const SizedBox(height: 10),
        TextFieldWrapper(
          isRequired: widget.isRequired,
          child: TextFormField(
            controller: widget.controller,
            style: AppTextStyle.appTextStyleSmall(context)
                .copyWith(color: Colors.black),
            readOnly: true,
            onTap: () => showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((value) {
              if (value == null) {
                return;
              }
              setState(() {
                widget.controller.text = DateFormat("hh:MM")
                    .format(DateTime(0, 0, 0, value.hour, value.minute));
              });
              widget.selectedValue;
            }),
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }
}
