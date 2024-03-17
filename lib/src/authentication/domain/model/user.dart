import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserModel extends Equatable {
  final String uid;
  final String email;
  final String displayName;
  final String profileUrl;
  final bool isVerified;
  const UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.profileUrl,
    this.isVerified = false,

  });

  factory UserModel.fromFirebase(UserCredential firebaseUser) {
    return UserModel(
      uid: firebaseUser.user!.uid,
      email: firebaseUser.user?.email ?? '' ,
      displayName: firebaseUser.user?.displayName ?? '',
      profileUrl: firebaseUser.user?.photoURL ?? '' ,
    );
  }
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      displayName: data['displayName'],
      profileUrl: data['profileUrl'],
      isVerified: data['isVerified']
    );
  }
  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "email": email,
      "displayName": displayName,
      "profileUrl": profileUrl,
       "isVerified": isVerified
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [uid, email,displayName, profileUrl ];
}
