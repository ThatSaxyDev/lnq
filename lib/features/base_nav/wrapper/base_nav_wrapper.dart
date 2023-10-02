// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lnq/shared/app_extensions.dart';
import 'package:lnq/theme/palette.dart';

class BaseNavWrapper extends ConsumerWidget {
  const BaseNavWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData currentTheme = ref.watch(themeNotifierProvider);
    return Scaffold(
      backgroundColor: currentTheme.backgroundColor,
      body: 'Base'.txt14().alignCenter(),
    );
  }
}
