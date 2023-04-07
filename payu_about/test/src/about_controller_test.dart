import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:payu_about/src/about_controller.dart';
import 'package:payu_about/src/about_item.dart';
import 'package:payu_core/payu_core.dart';

import 'about_controller_test.mocks.dart';

@GenerateMocks([
  AboutItem,
  PayuLauncher,
])
void main() {
  late MockAboutItem item;
  late MockPayuLauncher launcher;
  late AboutController sut;

  setUpAll(() => WidgetsFlutterBinding.ensureInitialized());

  setUp(() {
    item = MockAboutItem();
    launcher = MockPayuLauncher();
    sut = AboutController(launcher);
  });

  group('AboutController', () {
    group('`didTapItem`', () {
      test('when `item` type is `customerService` then should call', () {
        const number = 'number';

        when(item.type).thenReturn(AboutItemType.customerService);
        when(item.value).thenReturn(number);
        when(launcher.call(any)).thenAnswer((e) async => true);

        sut.didTapItem(item);
        verify(launcher.call(number));
      });
    });
  });
}
