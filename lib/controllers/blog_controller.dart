import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/services/blog_firebase_services.dart';

class BlogController extends ChangeNotifier {
  final _blogFirebaseServices = BlogFirebaseServices();

  Stream<QuerySnapshot> get list {
    return _blogFirebaseServices.getBlogPosts();
  }
}
