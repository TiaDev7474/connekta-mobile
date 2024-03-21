import 'package:connekta/src/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:connekta/src/authentication/presentation/bloc/credential/credential_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutButton extends StatefulWidget {
  const SignOutButton({super.key});

  @override
  State<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CredentialBloc, CredentialState>(
      builder: (BuildContext context, state) {
        bool isLoading = state is CredentialLoading;
        return TextButton(
          onPressed: (){
               context.read<CredentialBloc>().add(SignOutSubmitEvent());
          },
          style: TextButton.styleFrom(
            minimumSize: const Size(150, 49),
            foregroundColor: Colors.white,
            backgroundColor: Colors.black87
          ),
          child: isLoading ? const CircularProgressIndicator(): const Text('Log out'),
        );
      },
      listener: (BuildContext context, state) {
         if(state is CredentialSuccess){
           context.read<AuthenticationBloc>().add(LoggedOutEvent());
         }
      },
    );
  }
}
