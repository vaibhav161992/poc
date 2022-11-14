import 'dart:io';

import 'package:flutter/foundation.dart';

/// This class is a wrapper to allow proper tests on platform specific functionality.
///
/// Given that `dart:io` is not available on web, we must check if the app is being run on web or not before
/// trying to access this lib.
class LAFPlatform {
  bool isIos() {
    if (kIsWeb) {
      return false;
    }
    return Platform.isIOS;
  }

  bool isAndroid() {
    if (kIsWeb) {
      return false;
    }
    return Platform.isAndroid;
  }

  bool isWeb() {
    return kIsWeb;
  }
}
