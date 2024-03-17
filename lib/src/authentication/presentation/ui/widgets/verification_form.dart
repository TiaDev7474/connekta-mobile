import 'package:connekta/src/authentication/presentation/bloc/credential/credential_bloc.dart';
import 'package:connekta/src/core/common/constants/path_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerificationForm extends StatefulWidget {
  const VerificationForm({super.key});

  @override
  State<VerificationForm> createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<CredentialBloc>().add(VerificationStreamRequestedEvent());
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 12.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CredentialBloc, CredentialState>(
            listener: (BuildContext context, CredentialState state) {
               if(state is CredentialSuccess){
                  context.go(PathName.discussionsPath);
               }
            },
            builder: (BuildContext context, CredentialState state) {
               if(state is CredentialSuccess){
                  return const Text('Email verified successfully');
               }
               if( state is CredentialLoading){
                 return const Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                       CircularProgressIndicator(),
                       Text("Waiting for email verification!")
                   ],
                 );
               }
               return const Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   CircularProgressIndicator(),
                   Text("Waiting for email verification!")
                 ],
               );
            },
          )
        ],
      )
    ]);
  }
}
