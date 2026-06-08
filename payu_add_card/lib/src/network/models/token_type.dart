enum TokenType {
  single('SINGLE'),
  multi('MULTI'),
  singleLongterm('SINGLE_LONGTERM');

  final String value;

  const TokenType(this.value);
}

