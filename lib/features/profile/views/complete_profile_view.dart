// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lnq/shared/app_extensions.dart';
import 'package:lnq/shared/app_widgets/button.dart';
import 'package:lnq/shared/app_widgets/text_input.dart';
import 'package:lnq/shared/utils/keyboard_utils.dart';
import 'package:lnq/theme/palette.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:xtended/xtended.dart';

class CompleteProfileVIew extends ConsumerStatefulWidget {
  const CompleteProfileVIew({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CompleteProfileVIewState();
}

class _CompleteProfileVIewState extends ConsumerState<CompleteProfileVIew> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();
  final ValueNotifier<bool> pinVisible = false.notifier;
  final ValueNotifier<bool> confirmPinVisible = false.notifier;
  void pinVisibility() => pinVisible.value = !pinVisible.value;
  void confirmPinVisibility() =>
      confirmPinVisible.value = !confirmPinVisible.value;

  @override
  void dispose() {
    _nameController.dispose();
    _pinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = ref.watch(themeNotifierProvider);
    return Scaffold(
      backgroundColor: currentTheme.backgroundColor,
      body: VStack.scrollable(
        [
          60.sbH,
          'Welcome to Lnq'.txt20(fontW: F.w6),
          7.sbH,
          'But first,'.txt16(),
          50.sbH,

          //! name input
          TextInputWidget(
            inputTitle: 'What do your friends call you?',
            hintText: 'e.g. notebro, journalWarrior',
            controller: _nameController,
            onTapOutside: () => dropKeyboard(),
            keyboardType: TextInputType.emailAddress,
          ),
          20.sbH,

          //! pin input
          pinVisible.sync(
            builder: (context, value, child) => TextInputWidget(
              inputTitle: 'And create a 5-digit pin',
              hintText: 'e.g. * * * * *',
              inputFormatters: [
                LengthLimitingTextInputFormatter(5),
              ],
              controller: _pinController,
              onTapOutside: () => dropKeyboard(),
              keyboardType: TextInputType.number,
              obscuretext: !pinVisible.value,
              suffixIcon: Icon(pinVisible.value
                      ? PhosphorIcons.regular.eye
                      : PhosphorIcons.fill.eyeSlash)
                  .padding(
                      [Edge.horizontal], 10.sp).action(() => pinVisibility()),
            ),
          ),
          20.sbH,
          [confirmPinVisible, _pinController].multiSync(
            builder: (context, child) => AnimatedContainer(
              duration: 500.ms,
              height: _pinController.text.length == 5 ? 60.h : 0,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: TextInputWidget(
                  inputTitle: 'Type the pin again, trust me',
                  hintText: 'e.g. * * * * *',
                  controller: _confirmPinController,
                  onTapOutside: () => dropKeyboard(),
                  keyboardType: TextInputType.number,
                  obscuretext: !confirmPinVisible.value,
                  suffixIcon: Icon(confirmPinVisible.value
                          ? PhosphorIcons.regular.eye
                          : PhosphorIcons.fill.eyeSlash)
                      .padding([Edge.horizontal], 10.sp).action(
                          () => confirmPinVisibility()),
                ),
              ),
            ),
          ),
          35.sbH,

          BButton(
            onTap: () {},
            text: 'Continue',
          ),
        ],
        alignment: MainAxisAlignment.start,
        horizontalAlignment: CrossAxisAlignment.center,
      ).padding([Edge.horizontal], 20.sp),
    );
  }
}
