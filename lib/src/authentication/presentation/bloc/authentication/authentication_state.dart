part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthInitialState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {
  final String uid;
  final bool isEmailVerified;
  final String? email;
  final bool isProfileFilled;
  AuthenticatedState({required this.uid , this.isEmailVerified = false, this.email, this.isProfileFilled= false});

}
class UnAuthenticatedState extends AuthenticationState {}
