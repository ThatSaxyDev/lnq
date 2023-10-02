import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lnq/core/routing/router.dart';
import 'package:lnq/env/env.dart';
import 'package:lnq/shared/app_texts.dart';
import 'package:lnq/theme/palette.dart';
import 'package:routemaster/routemaster.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: Env.baseUrl,
    anonKey: Env.apiKey,
  );
  runApp(
    const ProviderScope(child: LnqApp()),
  );
}

class LnqApp extends ConsumerWidget {
  const LnqApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return Builder(builder: (context) {
            return MaterialApp.router(
              title: AppTexts.appName,
              debugShowCheckedModeBanner: false,
              theme: ref.watch(themeNotifierProvider),
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
