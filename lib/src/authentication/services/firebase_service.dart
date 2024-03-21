import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connekta/src/authentication/domain/model/user.dart';
import 'package:connekta/src/core/errors/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseService {
  Future<String> getCurrentUuid();
  Future<bool> isSignIn();
  Stream<UserModel> getSingleUser(String id);
  Future<void> storeCurrentUser(UserModel user);
  Stream<List<UserModel>> getAllUser(UserModel user);
  Future<void> signInWithPasswordAndEmail(String email, String password);
  Future<void> signUpWithPasswordAndEmail(String email, String password);
  Future<void> sendVerificationEmail();
  Future<void> forgotPassword(String email);
  Future<void> signOut();
  Future<User?>  getCurrentUser();
  Future<void> updateIsEmailVerified();
  Future<void> updateUserProfile(User user);
}

class FirebaseServiceImpl implements FirebaseService {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  const FirebaseServiceImpl(
      {required this.firebaseAuth, required this.firestore});
  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Stream<List<UserModel>> getAllUser(UserModel user) {
    final usersCollectionsRef = firestore.collection("users");
    return usersCollectionsRef
        .limit(1)
        .where('uid', isNotEqualTo: user.uid)
        .snapshots()
        .map((querySnapshot){
      return querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    });
  }

  @override
  Future<String> getCurrentUuid() async {
     return firebaseAuth.currentUser!.uid;
  }

  @override
  Stream<UserModel> getSingleUser(String id) {
    final usersCollectionsRef = firestore.collection("users");
    return usersCollectionsRef
        .limit(1)
        .where('uid', isEqualTo: id)
        .snapshots()
        .map((querySnapshot){
      return querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList()[0];
    });
  }

  @override
  Future<bool> isSignIn() async{
    return firebaseAuth.currentUser?.uid != null;
  }

  @override
  Future<void> sendVerificationEmail() async {
    // TODO: implement sendVerificationEmail
    return await firebaseAuth.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> signInWithPasswordAndEmail(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {
      //todo catch all possible error
      throw ServerException();
    }
  }

  @override
  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }

  @override
  Future<void> signUpWithPasswordAndEmail(String email, String password) async {
     try{
        UserCredential credential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        await storeCurrentUser(UserModel.fromFirebase(credential));
        await sendVerificationEmail();
     }on FirebaseAuthException {
        throw ServerException();
     }
  }

  @override
  Future<void> storeCurrentUser(UserModel user) async {
    final userCollectionRef = firestore.collection("users");
    final uid = await getCurrentUuid();
    userCollectionRef.doc(uid).get().then((DocumentSnapshot doc) {
      if (!doc.exists) {
        final newUser = UserModel(
          uid: uid,
          email: user.email,
          displayName: user.displayName,
          profileUrl: user.profileUrl,
        ).toDocument();
        userCollectionRef.doc(uid).set(newUser);
      }
    });
  }

  @override
  Future<User?> getCurrentUser() async {
     return  firebaseAuth.currentUser;
  }

  @override
  Future<void> updateIsEmailVerified() async {
    // TODO: implement updateIsEmailVerified
     final userCollectionRef = firestore.collection("users");
     final uid = await getCurrentUuid();
     userCollectionRef.doc(uid).update({"isVerified": true});
  }

  @override
  Future<void> updateUserProfile(User user) async {
    // TODO: implement updateUserProfile
    final userCollectionRef = firestore.collection("users");
    final DocumentSnapshot doc = await userCollectionRef.doc(user.uid).get();
    final Map<String, dynamic> updateData = {};
    final firebaseUser = await getCurrentUser();
    if(user.email!.isNotEmpty){
       updateData['email'] = user.email;
       await firebaseUser?.updateEmail(user.email!);

    }
    if(user.displayName!.isNotEmpty){
      updateData['displayName'] = user.displayName;
    }
    if(doc.exists){

    }
    throw UnimplementedError();
  }

}

