class NotificationModel {
  final String id, title, description, createdAt;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['uuid'] ?? '',
      title: json['title'] ?? '',
      // description приходит как HTML: "<p>version-2</p>"
      description: json['description'] ?? '',
      // формат "2026-09-20 14:14:06" - с пробелом, без T и таймзоны
      createdAt: json['created_at'] ?? '',
      isRead: json['is_read'] ?? false,
    );
  }

  NotificationModel copyWith({bool? isRead}) {
    return NotificationModel(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      isRead: isRead ?? this.isRead,
    );
  }

  /// "2026-09-20 14:14:06" -> "20.09.2026"
  String get formattedDate {
    final DateTime? dt = DateTime.tryParse(createdAt);
    if (dt == null) return createdAt;
    String two(int v) => v.toString().padLeft(2, '0');
    return '${two(dt.day)}.${two(dt.month)}.${dt.year}';
  }
}
