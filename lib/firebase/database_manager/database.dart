import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user.dart';

class DatabaseManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future createUserInFirestore(User user) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users')
          .doc(user.uid)
          .get();
      if (!doc.exists) {
        _firestore.collection('users').doc(user.uid).set({
          'user': user.user,
          'email': user.email,
          'createdOn': DateTime.now(),
        });
      }
    } catch (e) {
      throw Exception('Error in creating user $e');
    }
  }
}