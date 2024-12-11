import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/firestore_model.dart';
import '../model/user.dart';

class DatabaseManager {
  /// INSTANCE OF FIRESTORE TO INTERACT WITH FIRESTORE DATABASE
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  /// ASYNCHRONOUS METHOD TO CREATE A FIRESTORE USER IF THEY DON'T ALREADY EXIST
  Future createUserInFirestore(UserModel user) async {
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

  /// ASYNCHRONOUS METHOD TO FETCH DATA FROM FIRESTORE COLLECTION FOR MAIN
Future<List<Main>> fetchMainData() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('main').get();
      List<Main> mainList = snapshot.docs.map((doc) {
        return Main(
            img: doc['img1'],
            title: doc['text1']
        );
      }).toList();
      return mainList;
    } catch (e) {
      throw Exception('');
    }
}

  Future<List<WomenModel>> fetchWomenData() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('women').get();
      List<WomenModel> mainList = snapshot.docs.map((doc) {
        return WomenModel(
            img: doc['img1'],
            title: doc['text1']
        );
      }).toList();
      return mainList;
    } catch (e) {
      throw Exception('');
    }
  }

  Future<List<WomenTop>> fetchWomenTopData() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('womenTops').get();
      List<WomenTop> mainList = snapshot.docs.map((doc) {
        return WomenTop(
            img: doc['img1'],
            title: doc['titleText1'],
            subTitle: doc['subTitle1'],
          amt: doc['amt1']
        );
      }).toList();
      return mainList;
    } catch (e) {
      throw Exception('');
    }
  }
}