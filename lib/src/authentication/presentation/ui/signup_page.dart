import 'package:connekta/src/authentication/presentation/ui/widgets/signup_form.dart';
import 'package:connekta/src/core/common/constants/path_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Connekta.",
                    style: Theme.of(context)
                        .textTheme
                        .copyWith(
                          titleLarge: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        .titleLarge,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Please fill up the form to create an account",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              const SignUpForm(),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account ?"),
                        TextButton(
                            onPressed: () {
                              context.pushReplacement(PathName.loginPath);
                            },
                            child: const Text("Login"))
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
