import 'package:flutter/material.dart';
import 'package:poc/core/localization/app_localization.dart';

class LoadingView extends StatelessWidget {
  /// Defines the message that is displayed below the image.
  final String message;

  const LoadingView({
    Key? key,
    this.message = 'Getting everything ready...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const CircularProgressIndicator(), Text(AppLocalization.of(context)!.translate('getting_ready'))],
        ),
      ),
    );
  }
}
