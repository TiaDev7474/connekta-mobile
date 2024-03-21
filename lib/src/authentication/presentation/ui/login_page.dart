import 'package:connekta/src/authentication/presentation/ui/widgets/login_form.dart';
import 'package:connekta/src/core/common/constants/path_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
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
                    "Login to Connekta.",
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
                    "Welcome again,please log in to continue",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              const LoginForm(),
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
                        const Text("Don't have an account ?"),
                        TextButton(
                            onPressed: () {
                              context.pushReplacement(PathName.signUpPath);
                            },
                            child: const Text("Sign up"))
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
