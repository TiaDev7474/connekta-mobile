import 'package:connekta/src/authentication/presentation/bloc/credential/credential_bloc.dart';
import 'package:connekta/src/core/common/constants/path_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  String _email = '';
  bool isVisible = false;

  void _submitForm() {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form data
      print('Password: $_password'); // Print the password
      print('Email: $_email');
      context.read<CredentialBloc>().add(SignInSubmitEvent(
          email: _email, password: _password)); // Print the email
    }
  }

  void _togglePasswordVisible() {
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
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                border: const OutlineInputBorder(),
                hintText: "Enter your email address here",
                hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
              ),
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
                      onPressed: _togglePasswordVisible,
                      icon: isVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                  border: const OutlineInputBorder(),
                  hintText: "Enter your password here",
                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle),
              obscureText: !isVisible,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: _submitForm, // Text on the button
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 8.0,
                  minimumSize: const Size.fromHeight(50),
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  ),
                ),
                child: BlocConsumer<CredentialBloc, CredentialState>(
                  builder: (BuildContext context, state) {
                    if (state is CredentialLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is CredentialSuccess) {
                      return const Text("Logged in");
                    }
                    return const Text("Login");
                  },
                  listener: (BuildContext context, CredentialState state) {
                    if (state is CredentialSuccess) {
                      context.go(PathName.discussionsPath);
                    }
                  },
                ),
            )
          ],
        ));
  }
}
