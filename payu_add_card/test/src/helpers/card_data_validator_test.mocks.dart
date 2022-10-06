// Mocks generated by Mockito 5.3.2 from annotations
// in payu_add_card/test/src/helpers/card_data_validator_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:payu_add_card/src/finders/payment_card_provider_finder.dart'
    as _i3;
import 'package:payu_add_card/src/helpers/card_date_parser.dart' as _i2;
import 'package:payu_add_card/src/models/payment_card_provider.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [CardDateParser].
///
/// See the documentation for Mockito's code generation for more information.
class MockCardDateParser extends _i1.Mock implements _i2.CardDateParser {
  MockCardDateParser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  DateTime? parse(String? value) => (super.noSuchMethod(Invocation.method(
        #parse,
        [value],
      )) as DateTime?);
}

/// A class which mocks [PaymentCardProviderFinder].
///
/// See the documentation for Mockito's code generation for more information.
class MockPaymentCardProviderFinder extends _i1.Mock
    implements _i3.PaymentCardProviderFinder {
  MockPaymentCardProviderFinder() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.PaymentCardProvider? find(String? value) =>
      (super.noSuchMethod(Invocation.method(
        #find,
        [value],
      )) as _i4.PaymentCardProvider?);
}
