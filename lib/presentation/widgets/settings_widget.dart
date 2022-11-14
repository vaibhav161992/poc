import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc/presentation/utils/laf_values.dart';

import '../../blocs/appsettings/app_settings_bloc.dart';
import '../../core/localization/app_localization.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key,}) : super(key: key);
  static const keyPrefix = 'SettingsWidget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
          builder: (context, state) {
            if (state is AppSettingsOnLoadState) {
              return Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: LAFPaddings.paddings20.h,
                                horizontal: LAFPaddings.paddings10.w),
                            child: Text(
                              AppLocalization.of(context)!
                                  .translate('language_header'),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<AppSettingsBloc>(context).add(
                                AppSettingsOnLoadEvent(
                                    locale: const Locale('en'),
                                    themeMode: (BlocProvider.of<
                                        AppSettingsBloc>(context)
                                        .state as AppSettingsOnLoadState)
                                        .themeMode));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: LAFPaddings.paddings10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalization.of(context)!
                                      .translate('english_language'),
                                ),
                                state.locale != const Locale('en')
                                    ? const Icon(Icons.circle_outlined,
                                    color: Colors.grey)
                                    : const Icon(
                                  Icons.adjust_rounded,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<AppSettingsBloc>(context).add(
                                AppSettingsOnLoadEvent(
                                    locale: const Locale('es'),
                                    themeMode: (BlocProvider.of<
                                        AppSettingsBloc>(context)
                                        .state as AppSettingsOnLoadState)
                                        .themeMode));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: LAFPaddings.paddings10.h,
                                horizontal: LAFPaddings.paddings10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalization.of(context)!
                                      .translate('spanish_language'),
                                ),
                                state.locale != const Locale('es', '')
                                    ? const Icon(
                                  Icons.circle_outlined,
                                  color: Colors.grey,
                                )
                                    : const Icon(
                                  Icons.adjust_rounded,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: LAFSizes.size16.h,
                          child: Divider(
                            height: 0.5.h,
                            color: Colors.grey,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: LAFPaddings.paddings10.h,
                                horizontal: LAFPaddings.paddings10.w),
                            child: Text(
                              AppLocalization.of(context)!
                                  .translate('themes_header'),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: LAFSizes.size12.h,
                        ),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<AppSettingsBloc>(context).add(
                                AppSettingsOnLoadEvent(
                                    locale: (BlocProvider.of<AppSettingsBloc>(
                                        context)
                                        .state as AppSettingsOnLoadState)
                                        .locale,
                                    themeMode: ThemeMode.dark));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: LAFPaddings.paddings10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalization.of(context)!
                                      .translate('dark_theme'),
                                ),
                                state.themeMode != ThemeMode.dark
                                    ? const Icon(
                                  Icons.circle_outlined,
                                  color: Colors.grey,
                                )
                                    : const Icon(
                                  Icons.adjust_rounded,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<AppSettingsBloc>(context).add(
                                AppSettingsOnLoadEvent(
                                    locale: (BlocProvider.of<AppSettingsBloc>(
                                        context)
                                        .state as AppSettingsOnLoadState)
                                        .locale,
                                    themeMode: ThemeMode.light));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: LAFPaddings.paddings10.h,
                                horizontal: LAFPaddings.paddings10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalization.of(context)!
                                      .translate('light_theme'),
                                ),
                                state.themeMode != ThemeMode.light
                                    ? const Icon(
                                  Icons.circle_outlined,
                                  color: Colors.grey,
                                )
                                    : const Icon(
                                  Icons.adjust_rounded,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<AppSettingsBloc>(context).add(
                                AppSettingsOnLoadEvent(
                                    locale: (BlocProvider.of<AppSettingsBloc>(
                                        context)
                                        .state as AppSettingsOnLoadState)
                                        .locale,
                                    themeMode: ThemeMode.system));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: LAFPaddings.paddings10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalization.of(context)!
                                      .translate('system_theme'),
                                ),
                                state.themeMode != ThemeMode.system
                                    ? const Icon(
                                  Icons.circle_outlined,
                                  color: Colors.grey,
                                )
                                    : const Icon(
                                  Icons.adjust_rounded,
                                  color: Colors.green,
                                ),

                                // You can play with the width to adjust your
                                // desired spacing
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}