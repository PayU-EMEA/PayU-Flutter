class SelectionOption {
  final String id;
  final String label;
  final String? description;

  const SelectionOption({
    required this.id,
    required this.label,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'description': description,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
