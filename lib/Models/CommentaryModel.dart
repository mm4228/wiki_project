class Commentary {
  final int? id;
  final String content;

  const Commentary({required this.id, required this.content});
  factory Commentary.fromJson(Map<String,dynamic> json) => Commentary(
      id: json['id'],
      content: json['content']);


  Map<String, dynamic> toJson() => {
    'id': id,
    'content':content
  };
}