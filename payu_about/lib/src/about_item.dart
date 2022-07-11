import 'package:payu_translations/payu_translations.dart';

enum AboutItemType {
  publisher,
  customerService,
}

class AboutItem {
  final String title;
  final String value;
  final AboutItemType type;

  AboutItem._({
    required this.title,
    required this.value,
    required this.type,
  });

  factory AboutItem.publisher() {
    return AboutItem._(
      title: 'publisher'.translated(),
      value: 'publisher_value'.translated(),
      type: AboutItemType.publisher,
    );
  }

  factory AboutItem.customerService() {
    return AboutItem._(
      title: 'customer_service'.translated(),
      value: 'customer_service_value'.translated(),
      type: AboutItemType.customerService,
    );
  }
}
