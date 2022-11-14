import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/presentation/utils/laf_values.dart';

import 'laf_colors.dart';

class LAFAppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: LAFColors.ltWhiteColor,
      scaffoldBackgroundColor: LAFColors.ltWhiteColor,
      primaryColor: LAFColors.ltAppPrimaryColor,
      errorColor: LAFColors.ltAppErrorColor,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: LAFColors.ltAppPrimaryColor,
            fontSize: LAFTextSizes.textSizes20.sp,
            fontWeight: FontWeight.w400),
        backgroundColor: LAFColors.ltWhiteColor,
        iconTheme:
            const IconThemeData(color: LAFColors.ltAppPrimaryColor),
      ),
      textTheme: TextTheme(
        headline5: TextStyle(
            color: LAFColors.ltDarkGrayColor,
            fontSize: LAFTextSizes.textSizes18.sp,
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
          color: LAFColors.ltLightGrayColor,
          fontSize: LAFTextSizes.textSizes12.sp,
        ),
        headline6: TextStyle(
            color: LAFColors.ltLightGrayColor,
            fontSize: LAFTextSizes.textSizes16.sp,
            fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
            color: LAFColors.ltDarkGrayColor,
            fontSize: LAFTextSizes.textSizes18.sp,
            fontWeight: FontWeight.w600),
        bodyText2: TextStyle(
            color: LAFColors.ltDarkGrayColor,
            fontSize: LAFTextSizes.textSizes16.sp,
            fontWeight: FontWeight.w400),
        subtitle1: TextStyle(
            color: LAFColors.ltDarkGrayColor,
            fontSize: LAFTextSizes.textSizes16.sp,
            fontWeight: FontWeight.w400),
        subtitle2: textCaptionTheme,
        caption: textCaptionTheme,
        button: TextStyle(
            color: LAFColors.ltAppPrimaryColor,
            fontSize: LAFTextSizes.textSizes14.sp,
            fontWeight: FontWeight.bold),
      ),
      unselectedWidgetColor: Colors.blue[400],
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: LAFColors.ltWhiteColor,
      scaffoldBackgroundColor: LAFColors.ltDarkGrayColor,
      primaryColor: LAFColors.ltAppPrimaryColor,
      errorColor: LAFColors.ltAppErrorColor,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: LAFColors.ltAppPrimaryColor,
            fontSize: LAFTextSizes.textSizes20.sp,
            fontWeight: FontWeight.w400),
        backgroundColor: LAFColors.ltDarkGrayColor,
        iconTheme:
            const IconThemeData(color: LAFColors.ltAppPrimaryColor),
      ),
      textTheme: TextTheme(
        headline5: TextStyle(
            color: LAFColors.ltAppPrimaryColor,
            fontSize: LAFTextSizes.textSizes18.sp,
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
          color: LAFColors.ltLightGrayColor,
          fontSize: LAFTextSizes.textSizes12.sp,
        ),
        headline6: TextStyle(
            color: LAFColors.ltAppPrimaryColor,
            fontSize: LAFTextSizes.textSizes16.sp,
            fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
            color: LAFColors.ltAppPrimaryColor,
            fontSize: LAFTextSizes.textSizes18.sp,
            fontWeight: FontWeight.w600),
        bodyText2: TextStyle(
            color: LAFColors.ltAppPrimaryColor,
            fontSize: LAFTextSizes.textSizes16.sp,
            fontWeight: FontWeight.w400),
        subtitle1: TextStyle(
            color: LAFColors.ltAppPrimaryColor,
            fontSize: LAFTextSizes.textSizes16.sp,
            fontWeight: FontWeight.w400),
        subtitle2: TextStyle(
            color: LAFColors.ltAppPrimaryColor,
            fontSize: LAFTextSizes.textSizes14.sp,
            fontWeight: FontWeight.w400),
        caption: TextStyle(
          color: LAFColors.ltAppPrimaryColor,
          fontSize: LAFTextSizes.textSizes12.sp,
          fontWeight: FontWeight.w900,
        ),
        button: TextStyle(
            color: LAFColors.ltAppPrimaryColor,
            fontSize: LAFTextSizes.textSizes14.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  static var textCaptionTheme = TextStyle(
    color: LAFColors.ltLightGrayColor,
    fontSize: LAFTextSizes.textSizes12.sp,
    fontWeight: FontWeight.w900,
  );
}