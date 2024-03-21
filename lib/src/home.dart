import 'package:connekta/src/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:connekta/src/authentication/presentation/ui/widgets/sigin_out_button.dart';
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
      appBar: AppBar(
        title: const Text('Home')
      ),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (BuildContext context, state) {
          if (state is UnAuthenticatedState) {
            context.go(PathName.loginPath);
          }
          if (state is AuthenticatedState && !state.isEmailVerified) {
            context.go(Uri(path: PathName.verificationPath, queryParameters: {'email': state.email}).toString());
          }
          if (state is AuthenticatedState && !state.isProfileFilled) {
            context.go(PathName.profileInitPath);
          }
        },
        builder: (BuildContext context, AuthenticationState state) {
          return const Column(
            children: [
               SignOutButton(),
            ],
          );
        },
      ),
    );
  }
}
