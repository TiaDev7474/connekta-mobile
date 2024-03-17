


import 'package:connekta/src/authentication/domain/model/user.dart';
import 'package:connekta/src/authentication/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
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
  Future<User?> getCurrentUser();
  Future<void> updateIsEmailVerified();
}


class AuthenticationImpl implements AuthenticationRepository {
  final FirebaseService firebaseService;
  const AuthenticationImpl({required this.firebaseService});
  @override
  Future<void> forgotPassword(String email) {
     return firebaseService.forgotPassword(email);
  }

  @override
  Stream<List<UserModel>> getAllUser(UserModel user) {
    return firebaseService.getAllUser(user);
  }

  @override
  Future<String> getCurrentUuid() {
    return firebaseService.getCurrentUuid();
  }

  @override
  Stream<UserModel> getSingleUser(String id) {
    return firebaseService.getSingleUser(id);
  }

  @override
  Future<bool> isSignIn() {
    return firebaseService.isSignIn();
  }

  @override
  Future<void> sendVerificationEmail() {
    return firebaseService.sendVerificationEmail();
  }

  @override
  Future<void> signInWithPasswordAndEmail(String email, String password) {
    return firebaseService.signInWithPasswordAndEmail(email, password);
  }

  @override
  Future<void> signOut() {
    return firebaseService.signOut();
  }

  @override
  Future<void> signUpWithPasswordAndEmail(String email, String password) {
   return firebaseService.signUpWithPasswordAndEmail(email, password);
  }

  @override
  Future<void> storeCurrentUser(UserModel user) {
    return firebaseService.storeCurrentUser(user);
  }

  @override
  Future<User?> getCurrentUser() {
    // TODO: implement getCurrentUser
    return firebaseService.getCurrentUser();
  }

  @override
  Future<void> updateIsEmailVerified() {
    // TODO: implement updateIsEmailVerified
    return firebaseService.updateIsEmailVerified();
  }
  
}