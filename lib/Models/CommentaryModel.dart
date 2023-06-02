class Commentary {
  final int? id;
  final String content;
  final int userId;
  final int isSignaled;
  final DateTime date;
  final String userName;

  const Commentary({
    required this.id,
    required this.content,
    required this.userId,
    required this.isSignaled,
    required this.date,
    required this.userName,
  });

  factory Commentary.fromJson(Map<String, dynamic> json) => Commentary(
    id: json['id'],
    content: json['content'],
    userId: json['userId'],
    isSignaled: json['isSignaled'],
    date: DateTime.parse(json['date']),
    userName: json['userName'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'userId': userId,
    'isSignaled': isSignaled,
    'date': date.toIso8601String(),
    'userName': userName,
  };
}
