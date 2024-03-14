import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connekta/firebase_options.dart';
import 'package:connekta/src/core/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  final db = FirebaseFirestore.instance;

  final user = <String, dynamic>{
    "first":"Riry",
    "last":"Nomenjanahary",
     "email": "rirynomenjanahary@gmail.com"
  };
  //add a new doc
  db.collection("users")
      .add(user)
      .then(( DocumentReference doc) => {
        print('document id :${doc.id}')
  });
  print("test");

  runApp(const ConnektaApp());
}



