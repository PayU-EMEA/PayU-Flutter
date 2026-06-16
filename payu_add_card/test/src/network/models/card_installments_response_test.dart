import 'package:flutter_test/flutter_test.dart';

import 'package:payu_add_card/src/network/models/card_installments_response.dart';

void main() {
  group('CardInstallmentsResponse', () {
    group('`fromJson`', () {
      test('when json contains settings then should map model correctly', () {
        final model = CardInstallmentsResponse.fromJson({
          'provider': 'mock-provider',
          'numbers': [1, 3, 6],
          'settings': {
            'minAmount': 100,
          },
        });

        expect(model.provider, equals('mock-provider'));
        expect(model.numbers, equals([1, 3, 6]));
        expect(model.settings, isNotNull);
        expect(model.settings!.minAmount, equals(100));
      });

      test('when json does not contain settings then should map model correctly', () {
        final model = CardInstallmentsResponse.fromJson({
          'provider': 'mock-provider',
          'numbers': [1, 3, 6],
        });

        expect(model.provider, equals('mock-provider'));
        expect(model.numbers, equals([1, 3, 6]));
        expect(model.settings, isNull);
      });
    });

    group('`toJson`', () {
      test('should map model correctly', () {
        const model = CardInstallmentsResponse(
          provider: 'mock-provider',
          numbers: [1, 3, 6],
          settings: CardInstallmentsSettings(minAmount: 100),
        );

        final json = model.toJson();

        expect(json['provider'], equals(model.provider));
        expect(json['numbers'], equals(model.numbers));
        expect(json['settings'], equals(model.settings));
      });
    });
  });

  group('CardInstallmentsSettings', () {
    group('`fromJson`', () {
      test('should map model correctly', () {
        final model = CardInstallmentsSettings.fromJson({
          'minAmount': 123.45,
        });

        expect(model.minAmount, equals(123.45));
      });
    });

    group('`toJson`', () {
      test('should map model correctly', () {
        const model = CardInstallmentsSettings(minAmount: 123.45);

        expect(model.toJson(), {
          'minAmount': model.minAmount,
        });
      });
    });
  });
}

