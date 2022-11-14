import 'package:flutter/material.dart';

abstract class LAFPage<T> extends Page<T> {

  final String keyValue;
  final String routeName;

  LAFPage({
    required this.keyValue,
    required this.routeName,
  }) : super(
          key: ValueKey(keyValue),
          name: routeName,
        );
}
