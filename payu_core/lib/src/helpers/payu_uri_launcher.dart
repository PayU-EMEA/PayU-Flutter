import 'package:payu_core/payu_core.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class PayuLauncher {
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
}
