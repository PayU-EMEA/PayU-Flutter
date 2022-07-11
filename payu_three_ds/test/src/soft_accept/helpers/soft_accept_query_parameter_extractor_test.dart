import 'package:flutter_test/flutter_test.dart';

import 'package:payu_three_ds/src/soft_accept/helpers/soft_accept_query_parameter_extractor.dart';

void main() {
  group('`SoftAcceptQueryParameterExtractor`', () {
    late SoftAcceptQueryParameterExtractor sut;

    setUp(() {
      sut = SoftAcceptQueryParameterExtractor();
    });

    group('`extractAuthenticationIdQueryParameter`', () {
      test('when `uri` contains query parameter then should return correct `authenticationId`', () {
        expect(sut.extractAuthenticationId('www.example.com?authenticationId=helloWorld'), equals('helloWorld'));
        expect(sut.extractAuthenticationId('www.example.com?p=v&authenticationId=helloWorld'), equals('helloWorld'));
      });

      test('when `uri` does not contain query parameter then should return `null`', () {
        expect(sut.extractAuthenticationId('www.example.com'), equals(null));
        expect(sut.extractAuthenticationId('www.example.com?p=v&authenticionId=helloWorld'), equals(null));
      });
    });
  });
}
