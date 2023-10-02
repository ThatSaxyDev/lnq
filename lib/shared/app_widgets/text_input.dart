// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lnq/shared/app_extensions.dart';
import 'package:lnq/shared/app_fonts.dart';
import 'package:lnq/theme/palette.dart';

class TextInputWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final String inputTitle;
  final String hintText;
  final bool hastitle;
  final bool? filled;
  final bool readOnly;
  final Color? fillColor;
  final TextEditingController controller;
  final bool obscuretext;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Color? titleColor;
  final Color? borderColor;
  final F? titleFontWeight;
  final void Function()? onTap;
  final void Function()? onTapOutside;
  final Widget? iconn;
  final int? maxLength;
  final int? maxLines;
  final Widget? cardIcon;
  const TextInputWidget({
    Key? key,
    this.height,
    this.width,
    required this.inputTitle,
    required this.hintText,
    this.hastitle = true,
    this.filled = true,
    this.readOnly = false,
    this.fillColor,
    required this.controller,
    this.obscuretext = false,
    this.validator,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.suffix,
    this.focusNode,
    this.keyboardType,
    this.onChanged,
    this.onSaved,
    this.inputFormatters,
    this.titleColor,
    this.borderColor,
    this.titleFontWeight,
    this.onTap,
    this.onTapOutside,
    this.iconn,
    this.maxLength,
    this.maxLines,
    this.cardIcon,
  }) : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  ValueNotifier<bool> isFocused = false.notifier;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        isFocused.value = true;
      } else {
        isFocused.value = false;
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        // widget.onTap;
        // isFocused.value = true;
      },
      child: SizedBox(
        height: widget.hastitle ? 60.h : 40.h,
        width: widget.width ?? double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.hastitle == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.inputTitle.txt12(fontW: widget.titleFontWeight),
                  if (widget.cardIcon != null) widget.cardIcon!
                ],
              ),
            SizedBox(
              height: 40.h,
              child: isFocused.sync(
                builder: (context, value, child) => TextFormField(
                  readOnly: widget.readOnly,
                  maxLines: widget.maxLines ?? 1,
                  maxLength: widget.maxLength,
                  maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                  onTap: () {
                    if (widget.onTap != null) widget.onTap!.call();
                    // isFocused.value = true;
                  },
                  onTapOutside: (event) {
                    if (widget.onTapOutside != null) {
                      widget.onTapOutside!.call();
                    }
                    // isFocused.value = false;
                  },
                  keyboardType: widget.keyboardType,
                  focusNode: _focusNode,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  onChanged: widget.onChanged,
                  onSaved: widget.onSaved,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Palette.whiteColor,
                    fontFamily: AppFonts.mont,
                  ),
                  controller: widget.controller,
                  inputFormatters: widget.inputFormatters,
                  obscureText: widget.obscuretext,
                  obscuringCharacter: '*',
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    filled: widget.filled,
                    fillColor:
                        widget.fillColor ?? Colors.white.withOpacity(0.05),
                    // isDense: true,
                    suffix: widget.suffix,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.w)
                        .copyWith(left: 12.w),
                    helperText: " ",
                    helperStyle: const TextStyle(fontSize: 0.0005),
                    errorStyle: const TextStyle(fontSize: 0.0005),
                    suffixIcon: widget.suffixIcon,
                    suffixIconConstraints:
                        BoxConstraints(minHeight: 20.h, minWidth: 20.w),
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: const Color(0xFF767475),
                      fontSize: 14.sp,
                      fontFamily: AppFonts.mont,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isFocused.value
                              ? const Color(0xFFCBD2E0)
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isFocused.value
                              ? const Color(0xFFCBD2E0)
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isFocused.value
                              ? const Color(0xFFCBD2E0)
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isFocused.value
                              ? const Color(0xFFCBD2E0)
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isFocused.value
                              ? const Color(0xFFCBD2E0)
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  validator: widget.validator,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
