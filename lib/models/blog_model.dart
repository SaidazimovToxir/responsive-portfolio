import 'package:cloud_firestore/cloud_firestore.dart';

class BlogModel {
  String id;
  String title;
  Timestamp publishedAt;
  String description;

  BlogModel({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.description,
  });

  factory BlogModel.fromJson(QueryDocumentSnapshot query) {
    return BlogModel(
      id: query.id,
      title: query['title'],
      publishedAt: query['publishedAt'],
      description: query['description'],
    );
  }
}
