import 'package:connekta/src/authentication/presentation/ui/widgets/profile_init.form.dart';
import 'package:flutter/material.dart';

class ProfileInitPage extends StatelessWidget {
  const ProfileInitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Column(
                children: [
                   ProfileInitForm()
                ],
              ),
            ),
          ),

        ),
    );
  }
}
