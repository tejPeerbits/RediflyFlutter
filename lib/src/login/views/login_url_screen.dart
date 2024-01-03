import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redifly_flutter/src/login/views/login_screen.dart';

import '../../../common/core/app_image.dart';
import '../../../common/core/app_text_style.dart';
import '../../../common/core/responsive.dart';

class LoginUrlScreen extends StatefulWidget {
  const LoginUrlScreen({super.key});

  @override
  State<LoginUrlScreen> createState() => _LoginUrlScreenState();
}

class _LoginUrlScreenState extends State<LoginUrlScreen> {
  TextEditingController primaryURLTextController =
      TextEditingController(text: "test.REDiFly.com");

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
                  color: const Color(0xFF737373),
                  borderRadius: BorderRadius.circular(5.0.r),
                  border: Border.all(color: Colors.white)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "https:// ",
                            style: AppTextStyle.appTextStyleRegular(context),
                          ),
                        ],
                      ),
                      Expanded(
                        // color: Colors.white,
                        child: controllers(context,
                            title: "Set security url",
                            hint: "test.REDiFly.com",
                            controller: primaryURLTextController),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "V3 12",
                        style: AppTextStyle.appTextStyleVerySmall(context),
                      ),
                      const Spacer(),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            side: const BorderSide(color: Colors.white)),
                        disabledColor: Colors.grey,
                        onPressed: () {
                          // var loginModel = LoginModel(
                          //     clientId: "A82444C1-17BA-47F5-B086-E42C25FAB241",
                          //     email: emailTextController.text.trim().toString(),
                          //     password:
                          //         passwordTextController.text.trim().toString(),
                          //     userInfo: "",
                          //     accessToken: "");
                          // Repository.login(context, loginModel);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Continue',
                          style: AppTextStyle.appTextStyleSmall(context),
                        ),
                      ),
                    ],
                  ),
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
