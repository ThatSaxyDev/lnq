import 'package:lnq/shared/app_widgets/myicon.dart';
import 'package:lnq/shared/utils/nav.dart';
import 'package:lnq/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppBar(
  String title, {
  bool isLeftAligned = false,
  double? fontSize,
  FontWeight? fontWeight,
  List<Widget>? actions,
  TabBar? bottom,
  Color? color,
  Color? iconColor,
  bool showCustomIcon = false,
  Color? foregroundColor,
  double? leadingWidth,
  bool automaticallyImplyLeading = true,
  bool overrideAction = false,
  void Function()? doThisInstead,
  required BuildContext context,
}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    foregroundColor: foregroundColor ?? Palette.whiteColor,
    backgroundColor: color ?? Palette.whiteColor,
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: switch (automaticallyImplyLeading) {
      true => showCustomIcon
          ? Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: MyIcon(
                onTap: () {
                  if (overrideAction) {
                    doThisInstead!.call();
                  } else {
                    goBack(context);
                  }
                },
                icon: 'arrowBack',
              ),
            )
          : null,
      false => null,
    },
    elevation: 0,
    centerTitle: !isLeftAligned,
    leadingWidth: leadingWidth ?? 50.w,
    title: Text(
      title,
      style: TextStyle(
          fontSize: fontSize ?? 22.sp,
          color: Palette.blackColor,
          fontWeight: fontWeight,
        ),
    ),
    actions: actions ?? const [SizedBox.shrink()],
    bottom: bottom,
  );
}
