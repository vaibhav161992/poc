import 'package:fimber/fimber.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import '/core/consts/storage_keys.dart';
import '/infrastructure/storage/laf_Key_value_store.dart';

Future<void> fetchFcmToken() async {
  final sharedPrefKeyStore = GetIt.I<LafKeyValueStore>();

  await FirebaseMessaging.instance.getToken().then((token) async {
    Fimber.d('FCM Token: : $token');
    await sharedPrefKeyStore.write(StorageKeys.fcmToken, token);
  });
}
