import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String errorMessage;

  const ErrorView({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text(errorMessage)],
        ),
      ),
    );
  }
}
