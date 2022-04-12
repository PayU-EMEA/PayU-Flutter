import 'package:flutter_test/flutter_test.dart';

import 'package:payu_three_ds/payu_three_ds.dart';
import 'package:payu_three_ds/src/soft_accept/models/soft_accept_result.dart';
import '../../../resources/resource_reader.dart';

void main() {
  group('SoftAcceptResult', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_soft_accept_result.json');
        final result = SoftAcceptResult.fromJson(json);

        expect(result.message, equals(SoftAcceptMessage.displayFrame));
      });
    });
  });
}
