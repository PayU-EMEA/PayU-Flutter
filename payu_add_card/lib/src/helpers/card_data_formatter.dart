import 'package:flutter/services.dart';

class CardDataFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  CardDataFormatter._({required this.mask, required this.separator});

  factory CardDataFormatter.cvv() {
    return CardDataFormatter._(mask: 'xxx', separator: '');
  }

  factory CardDataFormatter.date() {
    return CardDataFormatter._(mask: 'xx/xxxx', separator: '/');
  }

  factory CardDataFormatter.number() {
    return CardDataFormatter._(mask: 'xxxx xxxx xxxx xxxx xxx', separator: ' ');
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final maskCharacters = mask.split('');
    final textCharacters = newValue.text.replaceAll(separator, '').split('');

    final buffer = StringBuffer();
    var maskCharacterOffset = 0;

    for (var textCharacterIndex = 0; textCharacterIndex < textCharacters.length; textCharacterIndex++) {
      final textCharacter = textCharacters[textCharacterIndex];

      final maskCharacterIndex = textCharacterIndex + maskCharacterOffset;
      if (maskCharacterIndex < maskCharacters.length) {
        final currentMaskCharacter = maskCharacters[maskCharacterIndex];

        if (currentMaskCharacter != separator) {
          buffer.write(textCharacter);
        } else {
          buffer.write(separator);
          buffer.write(textCharacter);
          maskCharacterOffset++;
        }
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.toString().length,
      ),
    );
  }
}
