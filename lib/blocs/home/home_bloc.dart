import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poc/core/consts/storage_keys.dart';
import 'package:poc/infrastructure/storage/laf_Key_value_store.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final LafKeyValueStore lafKeyValueStore = GetIt.I<LafKeyValueStore>();

  HomeBloc() : super(HomeInitial()) {
    on<HomeOnLoadEvent>(_onHomeLoad);
  }

  Future<FutureOr<void>> _onHomeLoad(HomeOnLoadEvent event, Emitter<HomeState> emit) async {
    final userName = await lafKeyValueStore.read(StorageKeys.userName);
    final userEmail = await lafKeyValueStore.read(StorageKeys.userEmail);
    final themeMode = await lafKeyValueStore.read(StorageKeys.themeSelected);
    final local = await lafKeyValueStore.read(StorageKeys.localeSelected);
    print('local is $local');
    emit(HomeOnLoadState(
      userEmail: userEmail??'',
      userName: userName??'',
        themeMode: themeMode??ThemeMode.system,
      locale: local==null?const Locale('en'):Locale(local)
    ));
  }
}
