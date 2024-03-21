import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInitForm extends StatefulWidget {
  const ProfileInitForm({super.key});

  @override
  State<ProfileInitForm> createState() => _ProfileInitFormState();
}

class _ProfileInitFormState extends State<ProfileInitForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  color: Theme.of(context).colorScheme.primary),
              child: Icon(
                Icons.person,
                size: 100,
                color: Theme.of(context).canvasColor,
              ),
            ),
            Positioned(
              right: 0,
              bottom: -4,
              child: IconButton(
                  onPressed: () {},
                  icon: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: const [BoxShadow(color: Colors.black)],
                      borderRadius: const BorderRadius.all(Radius.circular(50))
                    ),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      size: 24,
                      color: Colors.black87,
                    ),
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 24.0,
        ),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person_outline_rounded),
            border: const OutlineInputBorder(),
            hintText: "Username",
            hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 8.0,
            minimumSize: const Size.fromHeight(50),
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
          ),
          onPressed: () {},
          child: const Text("Continue"),
        )
      ],
    );
  }
}
