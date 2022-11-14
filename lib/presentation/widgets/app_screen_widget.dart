import 'package:flutter/material.dart';

///AppScreenWidget
class AppScreenWidget extends StatefulWidget {
  final Widget child;

  const AppScreenWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  AppScreenWidgetState createState() => AppScreenWidgetState();
}

class AppScreenWidgetState extends State<AppScreenWidget>
    with WidgetsBindingObserver {
  T? _ambiguate<T>(T? value) => value;

  // ! Why reading two times, when start
  @override
  void initState() {
    _ambiguate(WidgetsBinding.instance)!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    _ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    debugPrint('LifeCycleChangeState: $state');
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
