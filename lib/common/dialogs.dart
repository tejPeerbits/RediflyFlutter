import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

showLoading(BuildContext context) {
  showDialog(
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: 50.h,
        width: 50.w,
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        ),
      ),
    ),
    barrierDismissible: false,
    context: context,
  );
}

hideLoading(BuildContext context) {
  Navigator.pop(context);
}

// showSessionDialog() {
//   Get.dialog(
//     AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0.r),
//       ),
//       title: Text(
//         S.current.sessionTimeout,
//         style: Theme.of(Get.context!).textTheme.headline4,
//       ),
//       content: Text(
//         S.current.sessionTimeoutMsg,
//         style: Theme.of(Get.context!).textTheme.bodyText2,
//       ),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () async {
//             //Get.offAll(AuthenticationMain(Const.SIGNIN));
//             //KcurrentUser.value = UserModel();
//             Get.back();
//             // PrefUtils.clearPrefs();
//           },
//           child: Text(
//             S.current.signin,
//             style: Theme.of(Get.context!).textTheme.bodyText2,
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// showCustomDialog(
//     {required String title,
//     required String message,
//     required bool onlyCancel,
//     String? successButtonText,
//     String? cancelButtonText,
//     Function()? onSuccessPressed,
//     Function()? onCancelPressed}) {
//   Get.dialog(
//     AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0.r),
//       ),
//       title: Text(
//         title,
//         textAlign: TextAlign.center,
//         style: Theme.of(Get.context!).textTheme.subtitle1!.copyWith(
//               color: ThemeColor.lightPrimary,
//               fontSize: 27.sp,
//             ),
//       ),
//       content: Text(
//         message,
//         textAlign: TextAlign.center,
//         style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(
//               color: ThemeColor.black,
//               fontSize: 18.sp,
//             ),
//       ),
//       actions: <Widget>[
//         Row(
//           children: [
//             if (!onlyCancel)
//               Expanded(
//                 child: TextButton(
//                   onPressed: onSuccessPressed,
//                   child: Text(
//                     successButtonText ?? "",
//                     style: Theme.of(Get.context!).textTheme.subtitle1!.copyWith(
//                         color: ThemeColor.lightAccent, fontSize: 16.sp),
//                   ),
//                 ),
//               ),
//             Expanded(
//               child: TextButton(
//                 onPressed: onCancelPressed,
//                 child: Text(
//                   cancelButtonText ?? "",
//                   style: Theme.of(Get.context!)
//                       .textTheme
//                       .subtitle1!
//                       .copyWith(color: ThemeColor.lightAccent, fontSize: 16.sp),
//                 ),
//               ),
//             )
//           ],
//         )
//       ],
//     ),
//   );
// }
//
// showSubscriptionExpireDialog(context) async {
//   return await Get.dialog(
//     AlertDialog(
//       title: Center(
//         child: Text(
//           "Subscription Expire",
//           style: Theme.of(context)
//               .textTheme
//               .bodyText1!
//               .copyWith(color: ThemeColor.blueButtonColor, fontSize: 23.sp),
//         ),
//       ),
//       content: Text(
//         S.current.subscription_message,
//         style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18.sp),
//         textAlign: TextAlign.center,
//       ),
//       actions: [
//         Row(
//           children: [
//             Expanded(
//               child: MaterialButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 child: Text(
//                   "CLOSE",
//                   style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                         color: ThemeColor.blueButtonColor,
//                         fontSize: 16.sp,
//                       ),
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     ),
//   );
// }
