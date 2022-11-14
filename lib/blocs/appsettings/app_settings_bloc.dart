import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '/core/consts/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final _sharedPref = GetIt.I<SharedPreferences>();
  AppSettingsBloc() : super(const AppSettingsInitialState()) {
    on<AppSettingsOnLoadEvent>(_checkLanguageState);
  }

  FutureOr<void> _checkLanguageState(
      AppSettingsOnLoadEvent event, Emitter<AppSettingsState> emit) async {
    if (event.themeMode != null) {
      await _sharedPref.setString(
        StorageKeys.themeSelected,
        describeEnum(event.themeMode!),
      );
    }
    print(event.locale);
    if (event.locale != null) {
      await _sharedPref.setString(
        StorageKeys.localeSelected,
        event.locale!.toString(),
      );
    }

    final themeMode =
        _sharedPref.getString(StorageKeys.themeSelected) ?? 'system';

    ThemeMode theme;
    switch (themeMode) {
      case 'light':
        theme = ThemeMode.light;
        break;
      case 'dark':
        theme = ThemeMode.dark;
        break;
      default:
        theme = ThemeMode.system;
        break;
    }
    final localeMode =
        _sharedPref.getString(StorageKeys.localeSelected) ?? 'en';
    Locale locale;
    switch (localeMode) {
      case 'es':
        locale = const Locale('es');
        break;
      default:
        locale = const Locale('en');
        break;
    }
    emit(AppSettingsOnLoadState(
      locale: locale,
      themeMode: theme,
    ));
  }
}
