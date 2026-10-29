import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:payu_core/payu_core.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class PayuLauncher {
  // Android supports `FLAG_ACTIVITY_REQUIRE_NON_BROWSER` from API 30 (Android 11)
  static const _androidNonBrowserMinSdk = 30;

  bool? _supportsNonBrowserApplication;

  Future<bool> launch(String uriString) async {
    try {
      final uri = Uri.parse(uriString);
      final can = await launcher.canLaunchUrl(uri);
      if (!can) Logger.logError('Cannot launch uri: $uri');
      final result = await launcher.launchUrl(uri);
      if (!result) Logger.logError('Did not launch uri: $uri');
      return result;
    } catch (e) {
      Logger.logError(e.toString());
      rethrow;
    }
  }

  /// Launches [uriString] only if it is handled by a native application (Universal Link / App Link),
  /// never in a browser. Returns `false` if no application handles it or the platform can't guarantee that.
  Future<bool> launchNonBrowserApplication(String uriString) async {
    try {
      if (!await _isNonBrowserApplicationSupported()) return false;
      final uri = Uri.parse(uriString);
      final result = await launcher.launchUrl(uri, mode: launcher.LaunchMode.externalNonBrowserApplication);
      Logger.logInfo('launchNonBrowserApplication uri: $uri result: $result');
      return result;
    } catch (e) {
      Logger.logInfo('launchNonBrowserApplication error: $e');
      return false;
    }
  }

  Future<bool> _isNonBrowserApplicationSupported() async {
    return _supportsNonBrowserApplication ??= switch (defaultTargetPlatform) {
      TargetPlatform.iOS => true,
      TargetPlatform.android =>
        (await DeviceInfoPlugin().androidInfo).version.sdkInt >= _androidNonBrowserMinSdk,
      _ => false,
    };
  }
}
