import 'package:flutter_test/flutter_test.dart';

import 'package:payu_api/src/network_client_status.dart';
import 'package:payu_api/src/network_client_status_code.dart';
import '../resources/resource_reader.dart';

void main() {
  group('NetworkClientStatus', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('network_client_status_test.json');
        final model = NetworkClientStatus.fromJson(json);

        expect(model.statusCode, equals(NetworkClientStatusCode.success));
        expect(model.codeLiteral, equals('SUCCESS'));
        expect(model.code, equals('0'));
      });
    });
  });
}
