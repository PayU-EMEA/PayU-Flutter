// Mocks generated by Mockito 5.2.0 from annotations
// in payu_payment_methods/test/src/features/widget/payment_widget_service_test.dart.
// Do not manually edit this file.

import 'package:mockito/mockito.dart' as _i1;
import 'package:payu_payment_methods/src/features/widget/payment_widget_service.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [PaymentWidgetServiceDelegate].
///
/// See the documentation for Mockito's code generation for more information.
class MockPaymentWidgetServiceDelegate extends _i1.Mock
    implements _i2.PaymentWidgetServiceDelegate {
  MockPaymentWidgetServiceDelegate() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool isBlikAuthorizationCodeRequired() => (super.noSuchMethod(
      Invocation.method(#isBlikAuthorizationCodeRequired, []),
      returnValue: false) as bool);
}
