import 'package:flutter/material.dart';
import 'package:redifly_flutter/common/widgets/text_field_wrapper.dart';

import '../core/app_text_style.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? textFieldName;
  final bool? isBigTextField;
  final Function(String)? onChanged;
  final bool isRequired;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.textFieldName,
    this.isBigTextField,
    required this.isRequired,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          textFieldName ?? "",
          style: AppTextStyle.appTextStyleH3(context),
        ),
        const SizedBox(height: 10),
        TextFieldWrapper(
          isRequired: isRequired,
          child: TextFormField(
            style: AppTextStyle.appTextStyleSmall(context)
                .copyWith(color: Colors.black),
            controller: controller,
            onChanged: onChanged,
            minLines: isBigTextField ?? false ? 5 : 1,
            maxLines: isBigTextField ?? false ? 6 : 1,
            // validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }
}
