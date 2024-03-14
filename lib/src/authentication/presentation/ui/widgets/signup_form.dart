import 'package:connekta/src/core/common/constants/path_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  String _email = '';
  bool isVisible = false;

  void _submitForm() {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form data
      print('Password: $_password'); // Print the name
      print('Email: $_email'); // Print the email
    }
  }

  void _togglePasswordVisible(){
     setState(() {
       isVisible = !isVisible;
     });

  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email.'; // Return an error message if the email is empty
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
              decoration: const InputDecoration(
                 prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  hintText: "Enter your email address here",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                  )),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password.'; // Return an error message if the email is empty
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: IconButton(
                      onPressed: _togglePasswordVisible, icon: isVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)
                  ),
                  border: const OutlineInputBorder(),
                  hintText: "Enter your password here",
                  hintStyle: const TextStyle(fontWeight: FontWeight.w300)),
                  obscureText: !isVisible,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed:
                  _submitForm, // Text on the button
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black87,
                elevation: 8.0,
                minimumSize: const Size.fromHeight(50),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
              ),
              child: const Text('Sign up'),

            ),
          ],
        ));
  }
}
