
import 'dart:async';

abstract class LafKeyValueStore {
  const LafKeyValueStore();
  FutureOr<void> write(String key, dynamic value);
  FutureOr<T?> read<T>(String key, {T? defaultValue});
  FutureOr<void> delete(String key);
  void deleteAll();
}
