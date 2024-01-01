// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// import '../core/app_text_style.dart';
//
// class AppSignatureField extends StatefulWidget {
//   final String textFieldName;
//   final Function(String) onCompleted;
//   final bool isRequired;
//
//   const AppSignatureField(
//       {super.key,
//       required this.textFieldName,
//       required this.onCompleted,
//       required this.isRequired});
//
//   @override
//   State<AppSignatureField> createState() => _AppSignatureFieldState();
// }
//
// class _AppSignatureFieldState extends State<AppSignatureField> {
//   final SignatureController _signatureController = SignatureController();
//
//   @override
//   void initState() {
//     _signatureController.addListener(() {
//       _signatureController.onDrawEnd = () async {
//         debugPrint("drag ended");
//         var bytes = await _signatureController.toPngBytes();
//         if (bytes == null) return;
//         var base64Image = base64Encode(bytes.toList());
//         widget.onCompleted(base64Image);
//       };
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Row(
//           children: [
//             Text(
//               widget.textFieldName,
//               style: AppTextStyle.appTextStyleH3(context),
//             ),
//             const Spacer(),
//             TextButton(
//                 onPressed: () {
//                   _signatureController.clear();
//                 },
//                 child: Text(
//                   "Clear",
//                   style: AppTextStyle.appTextStyleSmall(context),
//                 )),
//           ],
//         ),
//         TextFieldWrapper(
//           isRequired: widget.isRequired,
//           child: Signature(
//             height: 200,
//             width: MediaQuery.of(context).size.width * 0.9,
//             backgroundColor: Colors.white,
//             controller: _signatureController,
//           ),
//         ),
//       ],
//     );
//   }
// }
