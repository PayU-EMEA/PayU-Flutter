import 'package:flutter_test/flutter_test.dart';

import 'package:payu_add_card/src/exceptions/add_card_exception.dart';
import 'package:payu_add_card/src/network/client/card_installments_network_client.dart';
import 'package:payu_add_card/src/network/models/card_installments_response.dart';
import 'package:payu_add_card/src/widget/card_installments_controller.dart';

class FakeCardInstallmentsNetworkClient implements CardInstallmentsNetworkClient {
  FakeCardInstallmentsNetworkClient(this.responseByBin);

  final Map<String, CardInstallmentsResponse> responseByBin;
  final List<String> requestedBins = [];

  @override
  Future<CardInstallmentsResponse> options(String cardBin) async {
    requestedBins.add(cardBin);
    return responseByBin[cardBin] ??
        const CardInstallmentsResponse(
          provider: 'p',
          numbers: [1, 3, 6],
        );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeCardInstallmentsNetworkClient client;
  late int changes;
  late CardInstallmentsController sut;

  setUp(() {
    client = FakeCardInstallmentsNetworkClient({
      '1234567890': const CardInstallmentsResponse(
        provider: 'p',
        numbers: [1, 3, 6],
      ),
      '9999999999': const CardInstallmentsResponse(
        provider: 'q',
        numbers: [1, 2, 4],
      ),
    });
    changes = 0;
    sut = CardInstallmentsController(
      client: client,
      onChanged: () => changes++,
    );
  });

  group('CardInstallmentsController', () {
    group('`didUpdateDigits`', () {
      test('when digits are shorter than 10 then should clear state', () {
        sut.cardInstallmentsOptions = const CardInstallmentsResponse(
          provider: 'p',
          numbers: [1, 3, 6],
        );
        sut.selectedNumber = 3;
        sut.isLoading = true;

        sut.didUpdateDigits('123456789');

        expect(sut.cardInstallmentsOptions, isNull);
        expect(sut.selectedNumber, isNull);
        expect(sut.isLoading, isFalse);
      });

      test('when same bin is passed again then should not refetch', () async {
        sut.didUpdateDigits('1234567890');
        await Future<void>.delayed(Duration.zero);
        final firstRequestedCount = client.requestedBins.length;

        sut.didUpdateDigits('1234567890123');
        await Future<void>.delayed(Duration.zero);

        expect(client.requestedBins, equals(['1234567890']));
        expect(client.requestedBins.length, equals(firstRequestedCount));
        expect(changes, greaterThan(0));
      });

      test('when new bin is passed then should fetch and cache options', () async {
        sut.didUpdateDigits('1234567890');
        await Future<void>.delayed(Duration.zero);

        expect(sut.cardInstallmentsOptions, equals(client.responseByBin['1234567890']));
        expect(sut.options, equals([3, 6]));
        expect(sut.isLoading, isFalse);
        expect(client.requestedBins, equals(['1234567890']));
      });

      test('when different bin is passed then should fetch again', () async {
        sut.didUpdateDigits('1234567890');
        await Future<void>.delayed(Duration.zero);

        sut.didUpdateDigits('9999999999');
        await Future<void>.delayed(Duration.zero);

        expect(client.requestedBins, equals(['1234567890', '9999999999']));
        expect(sut.cardInstallmentsOptions?.provider, equals('q'));
      });
    });

    group('`select`', () {
      test('should update selection and clear error', () {
        sut.errorText = 'error';
        sut.select(3);

        expect(sut.selectedNumber, equals(3));
        expect(sut.errorText, isNull);
      });
    });

    group('`validate`', () {
      test('when options exist and selection is missing then should throw', () {
        sut.cardInstallmentsOptions = const CardInstallmentsResponse(
          provider: 'p',
          numbers: [1, 3, 6],
        );

        expect(() => sut.validate(), throwsA(isA<AddCardException>()));
      });

      test('when selection exists then should not throw', () {
        sut.cardInstallmentsOptions = const CardInstallmentsResponse(
          provider: 'p',
          numbers: [1, 3, 6],
        );
        sut.selectedNumber = 3;

        expect(() => sut.validate(), returnsNormally);
      });
    });

    group('`prevalidate`', () {
      test('should populate errorText on validation failure', () {
        sut.cardInstallmentsOptions = const CardInstallmentsResponse(
          provider: 'p',
          numbers: [1, 3, 6],
        );

        sut.prevalidate();

        expect(sut.errorText, isNotNull);
        expect(changes, equals(1));
      });
    });
  });
}



