import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user.dart';

class DatabaseManager {
  /// INSTANCE OF FIRESTORE TO INTERACT WITH FIRESTORE DATABASE
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  /// ASYNCHRONOUS METHOD TO CREATE A FIRESTORE USER IF THEY DON'T ALREADY EXIST
  Future createUserInFirestore(User user) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users')
          .doc(user.uid)
          .get();
      /// IF THE USER DOESN'T EXIST, CREATE A NEW USER DOCUMENT IN 'USERS' COLLECTION
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