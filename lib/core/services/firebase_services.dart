import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseServices {
  //! Firebase instances
  final _firestore = FirebaseFirestore.instance;

  // Firestore: Get a user document by ID
  Future<Map<String, dynamic>?> getDoc(String uid) async {
    try {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return doc.data() as Map<String, dynamic>?;
    } catch (e) {
      debugPrint('Error fetching user: $e');
      return null;
    }
  }

  // Firestore: Update user data
  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(uid).update(data);
    } catch (e) {
      debugPrint('Error updating user: $e');
    }
  }

  // Firestore: Delete a user document
  Future<void> deleteUser(String uid) async {
    try {
      await _firestore.collection('users').doc(uid).delete();
    } catch (e) {
      debugPrint('Error deleting user: $e');
    }
  }
}
