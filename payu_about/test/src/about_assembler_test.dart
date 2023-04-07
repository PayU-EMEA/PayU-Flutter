import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payu_about/src/about_assembler.dart';
import 'package:payu_about/src/about_controller.dart';
import 'package:payu_core/payu_core.dart';

void main() {
  late AboutAssembler sut;

  setUpAll(() => WidgetsFlutterBinding.ensureInitialized());

  setUp(() {
    sut = AboutAssembler();
  });

  group('AboutAssembler', () {
    group('`assemble`', () {
      test('when called then expected dependencies are registered', () {
        sut.assemble();
        expect(sut.find<PayuLauncher>(), isA<PayuLauncher>());
        expect(sut.find<AboutController>(), isA<AboutController>());
      });
    });
  });
}
