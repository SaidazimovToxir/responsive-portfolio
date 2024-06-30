import 'package:cloud_firestore/cloud_firestore.dart';

class BlogFirebaseServices {
  final _blocCollection = FirebaseFirestore.instance.collection('blog');

  Stream<QuerySnapshot> getBlogPosts() async* {
    yield* _blocCollection.snapshots();
  }
}
