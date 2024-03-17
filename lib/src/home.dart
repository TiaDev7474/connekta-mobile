import 'package:connekta/src/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:connekta/src/authentication/presentation/ui/widgets/user_avatar.dart';
import 'package:connekta/src/core/common/constants/path_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    context.read<AuthenticationBloc>().add(AppStartedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (BuildContext context, state) {
          if (state is UnAuthenticatedState) {
            context.go(PathName.loginPath);
          }
          if (state is AuthenticatedState && !state.isEmailVerified) {
            context.go(Uri(path: PathName.verificationPath, queryParameters: {'email': state.email}).toString());

          }
        },
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticatedState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  UserAvatar(userid: state.uid),
                ],
              ),
            );
          }
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(LoggedOutEvent());
                },
                child: const Text("Log out"),
              )
            ],
          );
        },
      ),
    );
  }
}
