part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class SettingsOnLoadEvent extends SettingsEvent {
  const SettingsOnLoadEvent();
}
