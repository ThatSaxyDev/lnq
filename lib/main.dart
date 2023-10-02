import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lnq/core/routing/router.dart';
import 'package:lnq/shared/app_fonts.dart';
import 'package:lnq/shared/app_texts.dart';
import 'package:lnq/theme/palette.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(
    const ProviderScope(child: LnqApp()),
  );
}

class LnqApp extends StatelessWidget {
  const LnqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return Builder(builder: (context) {
            return MaterialApp.router(
              title: AppTexts.appName,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: AppFonts.mont,
                colorScheme: ColorScheme.fromSeed(seedColor: Palette.blueColor),
                useMaterial3: true,
              ),
              routerDelegate: RoutemasterDelegate(
                routesBuilder: (context) {
                  // if (userData != null) {
                  //   getData(ref: ref, data: userData);
                  //   if (userModel != null) {
                  //     return loggedInRoute;
                  //   }
                  // }
                  return loggedOutRoute;
                },
              ),
              routeInformationParser: const RoutemasterParser(),
            );
          });
        });
  }
}
