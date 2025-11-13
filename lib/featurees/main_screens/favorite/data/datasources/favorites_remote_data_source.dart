import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/favorite_model.dart';

class FavoritesRemoteDataSource {
  final FirebaseFirestore firestore;

  FavoritesRemoteDataSource({FirebaseFirestore? firestoreInstance})
    : firestore = firestoreInstance ?? FirebaseFirestore.instance;

  Future<List<FavoriteModel>> getFavorites(String uid) async {
    final snap = await firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .get();
    return snap.docs.map((d) => FavoriteModel.fromDoc(d)).toList();
  }

  Future<void> addFavorite(String uid, String productId) async {
    await firestore.collection('users').doc(uid).collection('favorites').add({
      'productId': productId,
      'addedAt': Timestamp.now(),
    });
  }

  Future<void> removeFavorite(String uid, String favId) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(favId)
        .delete();
  }
}
