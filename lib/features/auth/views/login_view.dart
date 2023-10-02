// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lnq/shared/app_extensions.dart';
import 'package:lnq/shared/app_grafiks.dart';
import 'package:lnq/shared/app_widgets/button.dart';
import 'package:lnq/shared/app_widgets/text_input.dart';
import 'package:lnq/shared/utils/keyboard_utils.dart';
import 'package:lnq/theme/palette.dart';
import 'package:xtended/xtended.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = ref.watch(themeNotifierProvider);
    return Scaffold(
      backgroundColor: currentTheme.backgroundColor,
      body: VStack(
        [
          50.sbH,
          AppGrafiks.logo.myImage(height: 100.h),
          15.sbH,
          HStack([
            'Welcome to Lnq!🫣'.txt16(fontW: F.w6),
            ' [pronounced "Link"]'.txt12()
          ]),
          18.sbH,
          'Lnq is a (maybe collaborative) tool for notes. Inspired by the legendary "Notion" 🖤'
              .txt14(),
          18.sbH,
          TextInputWidget(
            inputTitle: 'Email',
            hintText: 'e.g. you@mail.com',
            controller: _emailController,
            onTapOutside: () => dropKeyboard(),
            keyboardType: TextInputType.emailAddress,
          ),
          15.sbH,
          BButton(
            onTap: () {},
            text: 'Continue with email',
          ),
          const Spacer(),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Developed with 💙 by ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Kiishi',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ).alignCenter(),
          30.sbH,
        ],
      ).padding([Edge.horizontal], 25.sp),
    );
  }
}
