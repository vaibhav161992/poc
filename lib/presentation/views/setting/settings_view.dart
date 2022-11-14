import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/settings/settings_bloc.dart';
import '../../../core/localization/app_localization.dart';
import '../../widgets/settings_widget.dart';
import '../loading_view.dart';

void openSettingsModel(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
    transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(animation1),
        child: child,
      );
    },
    pageBuilder: (
        context,
        animation,
        secondaryAnimation,
        ) {
      return const SettingsViewWrapper();
    },
  );
}

class SettingsViewWrapper extends StatelessWidget {
  const SettingsViewWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()
        ..add(
          const SettingsOnLoadEvent(),
        ),
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  static const keyPrefix = 'settingsView';
  final int? activityId;

  const SettingsView({
    Key? key,
    this.activityId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context)!.translate('settings')),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          bloc: BlocProvider.of<SettingsBloc>(context),
          builder: (context, state) {
            if (state is SettingsOnLoadState) {
              return const SettingsWidget(

              );
            } else {
              return const LoadingView(
                key: Key('$keyPrefix-ErrorWidget'),
              );
            }
          },
        ),
      ),
    );
  }
}