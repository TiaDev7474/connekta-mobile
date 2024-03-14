import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connekta/src/core/common/constants/path_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("learn firestore"),
      ),
      body: Container(
        child: Column(
          children: [
            const Text("Firestore"),
            TextButton(
              onPressed: () => context.push(PathName.signUpPath),
              child: Text("Go to login"),
            )
          ],
        ),
      ),
    );
  }
}
