import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/core/app_colors.dart';
import '../../../common/core/app_image.dart';
import '../../../common/core/app_text_style.dart';
import '../../../common/core/responsive.dart';
import '../../../network/model/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController primaryURLTextController =
      TextEditingController(text: "https://sms.REDiFly.com");
  TextEditingController emailTextController =
      TextEditingController(text: "murali@redifly.com");
  TextEditingController passwordTextController =
      TextEditingController(text: "MurS1234-");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            AppImage.backgroundDark,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
          ),
          Image.network(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            "https://images.unsplash.com/photo-1515890922410-ae767899d6b3?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTF8fHxlbnwwfHx8fHw%3D",
          ),
          const ColoredBox(
            color: Color(0x2E484848),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(23.r),
              margin:
                  EdgeInsets.all(Responsive.isiPad(context) ? 45.r : 36.0.r),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5.0.r),
                  border: Border.all(color: Colors.white)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controllers(context,
                      title: "Primary URL",
                      hint: "https://sms.REDiFly.com",
                      controller: primaryURLTextController),
                  controllers(context,
                      title: "Username",
                      hint: "Enter Username here...",
                      controller: emailTextController),
                  controllers(context,
                      title: "Password",
                      hint: "Enter Password here...",
                      controller: passwordTextController,
                      obscureText: true),
                  const SizedBox(height: 9.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          side: const BorderSide(color: Colors.white),
                        ),
                        onPressed: () {},
                        child: Text(
                          'ADLogin',
                          style: AppTextStyle.appTextStyleSmall(context),
                        ),
                      ),
                      const Spacer(),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            side: const BorderSide(color: Colors.white)),
                        onPressed: () {
                          var loginModel = LoginModel(
                              clientId: "A82444C1-17BA-47F5-B086-E42C25FAB241",
                              email: emailTextController.text.trim().toString(),
                              password:
                                  passwordTextController.text.trim().toString(),
                              userInfo: "",
                              accessToken: "");
                          // Repository.login(context, loginModel);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => DashBoardScreen(),
                          //   ),
                          // );
                        },
                        child: Text(
                          'Continue',
                          style: AppTextStyle.appTextStyleSmall(context),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 14,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 9),
                    child: Text(
                      "V3 12",
                      style: AppTextStyle.appTextStyleVerySmall(context),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Logo at Bottom Left
          Positioned(
              bottom: 14.0,
              left: 14.0,
              child: Image.asset(
                AppImage.logoDark,
                height: 72,
                width: 72,
              )),
        ],
      ),
    );
  }

  Widget controllers(BuildContext context,
      {TextEditingController? controller,
      String? hint,
      String? title,
      bool obscureText = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: AppTextStyle.appTextStyleRegular(context),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5.r)),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
              hintText: hint,
              contentPadding: EdgeInsets.zero,
              hintStyle: AppTextStyle.appTextStyleSmall(context)
                  .copyWith(color: Colors.grey),
            ),
            style: AppTextStyle.appTextStyleSmall(context)
                .copyWith(color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
