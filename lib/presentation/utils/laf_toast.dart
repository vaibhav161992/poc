import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/theme/laf_colors.dart';

class LAFToast {
  static void successSnackBarMessage({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          child: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: LAFColors.ltWhiteColor),
          ),
        ),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: LAFColors.ltColorTeal,
        padding: EdgeInsets.all(20.w),
      ),
    );
  }

  static void errorSnackBarMessage({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: 30.h,
          child: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: LAFColors.ltWhiteColor),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: LAFColors.ltAppErrorColor,
        padding: EdgeInsets.only(left: 20.w, top: 90.h, bottom: 20.h),
      ),
    );
  }
}
