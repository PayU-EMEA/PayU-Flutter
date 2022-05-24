class ApplePayContact {
  /// The contact’s email address
  final String emailAddress;

  const ApplePayContact({
    required this.emailAddress,
  });

  Map<String, dynamic> toJson() {
    return {
      'emailAddress': emailAddress,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
