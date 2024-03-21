import 'package:connekta/src/authentication/presentation/bloc/credential/credential_bloc.dart';
import 'package:connekta/src/core/common/constants/path_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
    context.read<CredentialBloc>().close();
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
              if (state is CredentialSuccess) {
                Future.delayed(const Duration(seconds: 2), () {
                  context.go(PathName.discussionsPath);
                });
              }
            },
            builder: (BuildContext context, CredentialState state) {
              if (state is CredentialSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/verified.svg",
                        semanticsLabel: 'Acme Logo'),
                    const Text('Email verified successfully'),
                  ],
                );
              }
              if (state is CredentialLoading) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Waiting for email verification!")
                  ],
                );
              }
              return Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                  const SizedBox(height: 8.0),
                  Text(
                    "Waiting for email verification!",
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              );
            },
          )
        ],
      )
    ]);
  }
}
