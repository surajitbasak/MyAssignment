class Quote {
  final String id;
  final String content;
  final String author;
  final List<String> tags;
  final String dateAdded;
  final String dateModified;

  Quote({required this.id, required this.content, required this.author, required this.tags, required this.dateAdded, required this.dateModified});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['_id'],
      content: json['content'],
      author: json['author'],
      tags: List<String>.from(json['tags']),
      dateAdded: json['dateAdded'],
      dateModified: json['dateModified'],
    );
  }
}