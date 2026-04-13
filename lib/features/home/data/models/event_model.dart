class EventModel {
  final String id;
  final String title;
  final String description;
  final String date;
  final String category;
  final String imagePath;

  const EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    required this.imagePath,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      category: json['category'] as String,
      imagePath: json['imagePath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'category': category,
      'imagePath': imagePath,
    };
  }
}
