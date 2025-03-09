import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  //! Firebase instances
  final _firestore = FirebaseFirestore.instance;

  // Firestore: Get a user document by ID
  Future<Map<String, dynamic>?> getDoc(
    String uid, {
    required String collection,
  }) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(collection).doc(uid).get();
      return doc.data() as Map<String, dynamic>?;
    } catch (e) {
      rethrow;
    }
  }

  
}
