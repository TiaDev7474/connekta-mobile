import 'package:connekta/src/authentication/presentation/ui/forgot_password_page.dart';
import 'package:connekta/src/authentication/presentation/ui/login_page.dart';
import 'package:connekta/src/authentication/presentation/ui/profile_init_page.dart';
import 'package:connekta/src/authentication/presentation/ui/signup_page.dart';
import 'package:connekta/src/authentication/presentation/ui/verification_page.dart';
import 'package:connekta/src/core/common/constants/path_name.dart';
import 'package:connekta/src/home.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter settings = GoRouter(
      initialLocation: PathName.discussionsPath,
      routes: [
        GoRoute(
            path: PathName.discussionsPath,
            builder: (context, state) => const Home()
        ),
        GoRoute(
            path: PathName.loginPath,
            builder: (context, state) => const LoginPage()
        ),
        GoRoute(
            path: PathName.signUpPath,
            builder: (context, state) => const SignUpPage()
        ),
        GoRoute(
            path: PathName.forgotPasswordPath,
            builder: (context, state) => const ForgotPasswordPage()
        ),
        GoRoute(
            path: PathName.verificationPath,
            builder: (context, state) {
              final email = state.uri.queryParameters['email']!;
              return VerificationPage(userEmail: email);
          }
        ),
        GoRoute(
            path: PathName.profileInitPath,
            builder: ((context, state){
               return const ProfileInitPage();
            })
        )

      ]
  );


}