import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/responsive.dart';

class TextFieldWrapper extends StatelessWidget {
  const TextFieldWrapper({
    super.key,
    required this.child,
    required this.isRequired,
  });

  final Widget child;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final stopsValue = Responsive.isiPad(context) ? 0.01 : 0.02;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,
        gradient: isRequired
            ? LinearGradient(
                stops: [stopsValue, stopsValue],
                colors: const [Colors.red, Colors.white],
              )
            : null,
      ),
      child: child,
    );
  }
}
