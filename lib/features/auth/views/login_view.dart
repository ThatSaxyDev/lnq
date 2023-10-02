// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lnq/shared/app_extensions.dart';
import 'package:lnq/shared/app_grafiks.dart';
import 'package:lnq/theme/palette.dart';
import 'package:xtended/xtended.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = ref.watch(themeNotifierProvider);
    return Scaffold(
      backgroundColor: currentTheme.backgroundColor,
      body: VStack(
        [
          60.sbH,
          AppGrafiks.logo.myImage(height: 100.h),
          15.sbH,
          HStack([
            'Welcome to Lnq!🫣'.txt16(fontW: F.w6),
            ' [pronounced "link"]'.txt12()
          ]),
          18.sbH,
          'Lnq is a tool for notes. Inspired by the legendary "Notion" 🖤'
              .txt14(),
        ],
      ).padding([Edge.horizontal], 25.sp),
    );
  }
}
