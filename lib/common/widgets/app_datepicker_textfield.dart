import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redifly_flutter/common/widgets/text_field_wrapper.dart';

import '../core/app_text_style.dart';

class AppDatePickerTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? textFieldName;
  final DateTime? initialDate;
  final Function(String value) selectedValue;
  final bool isRequired;

  const AppDatePickerTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.textFieldName,
      this.initialDate,
      required this.selectedValue,
      required this.isRequired});

  @override
  State<AppDatePickerTextField> createState() => _AppDatePickerTextFieldState();
}

class _AppDatePickerTextFieldState extends State<AppDatePickerTextField> {
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
            readOnly: true,
            style: AppTextStyle.appTextStyleSmall(context)
                .copyWith(color: Colors.black),
            onTap: () => showDatePicker(
              context: context,
              initialDate: widget.initialDate ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            ).then((value) {
              if (value == null) {
                return;
              }
              setState(() {
                widget.controller.text = DateFormat("dd-MM-yyyy").format(value);
              });
              widget.selectedValue(widget.controller.text.toString());
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
