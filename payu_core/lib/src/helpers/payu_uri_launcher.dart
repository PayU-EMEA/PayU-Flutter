import 'package:payu_core/payu_core.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher_string.dart';

class PayuLauncher {
  Future<bool> call(String number) async {
    return await launch('tel://$number');
  }

  Future<bool> launchInBrowser(String uriString) async {
    return launch(uriString, launchMode: LaunchMode.externalApplication);
  }

  Future<bool> launch(String uriString,
      { LaunchMode launchMode = LaunchMode.platformDefault }) async {
    try {
      final uri = Uri.parse(uriString);
      final can = await launcher.canLaunchUrl(uri);
      if (!can) Logger.logError('Cannot launch uri: $uri');
      final result = await launcher.launchUrl(uri, mode: launchMode);
      if (!result) Logger.logError('Did not launch uri: $uri');
      return result;
    } catch (e) {
      Logger.logError(e.toString());
      rethrow;
    }
  }
}
