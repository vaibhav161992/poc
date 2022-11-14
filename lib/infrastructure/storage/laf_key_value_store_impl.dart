import 'dart:async';
import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'laf_Key_value_store.dart';

class LafKeyValueStoreImpl extends LafKeyValueStore {
  final SharedPreferences preferences;
  FlutterSecureStorage storage;
  LafKeyValueStoreImpl(this.preferences,
      {this.storage = const FlutterSecureStorage()}) {
    init();
  }
  Future<void> init() async {
    if (preferences.getBool('first_run') ?? true) {
      await storage.deleteAll();
      await preferences.setBool('first_run', false);
    }
  }

  @override
  FutureOr<void> write(String key, dynamic value) async {
    final storeValue = jsonEncode(value);
    Fimber.d(storeValue);
    await storage.write(key: key, value: storeValue);
  }

  @override
  FutureOr<T?> read<T>(String key, {T? defaultValue}) async {
    final returnValue = await storage.read(key: key);
    if (returnValue != null) {
      final dynamic newValue = jsonDecode(returnValue);
      Fimber.d(newValue.toString());
      return jsonDecode(returnValue) as T?;
    } else {
      return defaultValue;
    }
  }

  @override
  FutureOr<void> delete(String key) async {
    await storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
