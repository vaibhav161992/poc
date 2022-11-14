import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsInitialState()) {
    on<SettingsOnLoadEvent>(_onLoadState);
  }

  FutureOr<void> _onLoadState(
      SettingsOnLoadEvent event, Emitter<SettingsState> emit) async {
    emit(const SettingsOnLoadState());
  }
}
