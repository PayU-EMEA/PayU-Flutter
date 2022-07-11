import 'package:flutter_test/flutter_test.dart';
import 'package:payu_api/payu_api.dart';

import 'package:payu_three_ds/src/soft_accept/helpers/soft_accept_components.dart';
import 'package:payu_three_ds/src/soft_accept/helpers/soft_accept_query_parameter_extractor.dart';
import 'package:payu_three_ds/src/soft_accept/helpers/soft_accept_uri_modifier.dart';
import 'package:payu_three_ds/src/soft_accept/models/soft_accept_request.dart';
import 'package:payu_three_ds/src/soft_accept/network/client/soft_accept_network_client.dart';
import 'package:payu_three_ds/src/soft_accept/soft_accept_assembler.dart';
import 'package:payu_three_ds/src/soft_accept/soft_accept_controller.dart';
import 'package:payu_three_ds/src/soft_accept/soft_accept_service.dart';

void main() {
  late SoftAcceptAssembler sut;

  setUp(() {
    const redirectUri = 'https://merch-prod.snd.payu.com/front/threeds/?authenticationId=276c1934-fd80-43d9-b5da';
    const request = SoftAcceptRequest(redirectUri: redirectUri);

    sut = SoftAcceptAssembler(request);
  });

  group('CVVAuthorizationAssembler', () {
    group('`assemble`', () {
      test('when called then expected dependencies are registered', () {
        sut.assemble();
        expect(sut.find<SoftAcceptComponents>(), isA<SoftAcceptComponents>());
        expect(sut.find<SecureHttpClient>(), isA<SecureHttpClient>());
        expect(sut.find<SoftAcceptNetworkClient>(), isA<SoftAcceptNetworkClient>());
        expect(sut.find<SoftAcceptQueryParameterExtractor>(), isA<SoftAcceptQueryParameterExtractor>());
        expect(sut.find<SoftAcceptService>(), isA<SoftAcceptService>());
        expect(sut.find<SoftAcceptUriModifier>(), isA<SoftAcceptUriModifier>());
        expect(sut.find<SoftAcceptController>(), isA<SoftAcceptController>());
      });
    });
  });
}
