import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<T?> lafBottomSheet<T>(
  BuildContext context, {
  required Widget child,
  required String keyPrefix,
  double? maxHeight,
  double? minHeight,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isDismissible: false,
    constraints: BoxConstraints(
      maxHeight: maxHeight ?? (MediaQuery.of(context).size.height / 2).h,
      minHeight: minHeight ?? (MediaQuery.of(context).size.height / 2).h,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0.r),
    ),
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(16.w),
        child: Center(child: child),
      );
    },
  );
}
