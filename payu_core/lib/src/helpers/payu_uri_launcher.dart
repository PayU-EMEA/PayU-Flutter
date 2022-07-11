import 'package:url_launcher/url_launcher.dart' as launcher;

import 'package:payu_core/payu_core.dart';

class PayuLauncher {
  Future<bool> call(String number) async {
    return await launch('tel://$number');
  }

  Future<bool> launch(String uri) async {
    try {
      final can = await launcher.canLaunch(uri);
      if (!can) Logger.logError('Cannot launch uri: $uri');
      final result = await launcher.launch(uri);
      if (!result) Logger.logError('Did not launch uri: $uri');
      return result;
    } catch (e) {
      Logger.logError(e.toString());
      rethrow;
    }
  }
}
