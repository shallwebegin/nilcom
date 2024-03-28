import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nilcom/models/user_model.dart';

final discoverRepositoryProvider = Provider((ref) => DiscoverRepository(
    auth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance));

class DiscoverRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;

  DiscoverRepository({required this.auth, required this.firebaseFirestore});
  Stream<List<UserModel>> getProfilePhotos() {
    return firebaseFirestore
        .collection('users')
        .orderBy('profilePhoto', descending: true)
        .snapshots()
        .map((snapshot) {
      List<UserModel> list = [];
      for (var model in snapshot.docs) {
        list.add(UserModel.fromMap(model.data()));
      }
      return list;
    });
  }
}
