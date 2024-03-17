import 'package:connekta/src/authentication/domain/repository/authentication_repository.dart';
import 'package:connekta/src/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:connekta/src/authentication/presentation/bloc/credential/credential_bloc.dart';
import 'package:connekta/src/authentication/presentation/bloc/user/user_bloc.dart';
import 'package:connekta/src/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ConnektaApp extends StatelessWidget {
  const ConnektaApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
              authenticationRepository:
                  GetIt.instance<AuthenticationRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => CredentialBloc(
              authenticationRepository:
                  GetIt.instance<AuthenticationRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              authenticationRepository:
                  GetIt.instance<AuthenticationRepository>(),
            ),
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Connekta App',
          theme: ThemeData(
            textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: AppRouter.settings,
        ));
  }
}
