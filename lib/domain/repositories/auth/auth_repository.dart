import 'dart:async';

abstract class AuthRepository {
  FutureOr<bool?> hasCompleteLogin();
  FutureOr<void> completeLogin(
      {required String? token,
        required String? userName,
      required String? userEmail});
  FutureOr<String?> getToken();
  FutureOr<void> hasLogout();
}
