import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connekta/firebase_options.dart';
import 'package:connekta/src/authentication/domain/repository/authentication_repository.dart';
import 'package:connekta/src/authentication/services/firebase_service.dart';
import 'package:connekta/src/core/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  locator.registerFactory<FirebaseService>(() => FirebaseServiceImpl(
      firebaseAuth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance));
  locator.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationImpl(
      firebaseService: locator.get(),
    ),
  );

  runApp(const ConnektaApp());
}
