import 'package:cloud_firestore/cloud_firestore.dart';

class User {
 final String uid;
 final String user;
 final String email;
 final DateTime createOn;

 User(
     {required this.uid, required this.user, required this.email, required this.createOn});

 // Map<String, dynamic> toMap() {
 //  return {
 //   'user': user,
 //   'email': email,
 //   'createdOn': createOn,
 //  };
 // }
}