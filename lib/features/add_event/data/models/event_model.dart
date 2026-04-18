import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String eventId;
  final String userId;
  final String title;
  final String description;
  final int date; 
  final String categoryId;
  final String imagePath;

  const EventModel({
    required this.eventId,
    required this.userId,
    required this.title,
    required this.description,
    required this.date,
    required this.categoryId,
    required this.imagePath,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      eventId: json['eventId'] ?? '',
      userId: json['userId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      date: json['date'] is Timestamp 
          ? (json['date'] as Timestamp).millisecondsSinceEpoch 
          : (json['date'] as int),
      categoryId: json['categoryId'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventId': eventId,
      'userId': userId,
      'title': title,
      'description': description,
      'date': date,
      'categoryId': categoryId,
      'imagePath': imagePath,
    };
  }
}