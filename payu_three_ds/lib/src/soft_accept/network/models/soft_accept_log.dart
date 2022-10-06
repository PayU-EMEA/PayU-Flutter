class SoftAcceptLog {
  final String sender = 'Flutter - SDK PayU';
  final String event = 'receivedMessage';
  final String level = 'INFO';

  final String message;
  final String id;

  const SoftAcceptLog({
    required this.message,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'event': event,
      'level': level,
      'message': message,
      'id': id,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';

  @override
  int get hashCode => Object.hashAll([sender, event, level, message, id]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SoftAcceptLog &&
          sender == other.sender &&
          event == other.event &&
          level == other.level &&
          message == other.message &&
          id == other.id;
}
