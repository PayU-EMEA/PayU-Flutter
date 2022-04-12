import 'package:flutter_test/flutter_test.dart';

import 'package:payu_three_ds/src/soft_accept/network/models/soft_accept_log.dart';

void main() {
  group('SoftAcceptResult', () {
    group('`toJson`', () {
      test('when called then should map model correctly', () {
        const log = SoftAcceptLog(message: 'message', id: 'id');
        final json = log.toJson();

        expect(json['sender'], equals('Flutter - SDK PayU'));
        expect(json['event'], equals('receivedMessage'));
        expect(json['level'], equals('INFO'));
        expect(json['message'], equals(log.message));
        expect(json['id'], equals(log.id));
      });
    });
  });
}
