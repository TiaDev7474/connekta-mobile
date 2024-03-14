part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthInitialState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {
  final String uid;
  AuthenticatedState({required this.uid});
}
class UnAuthenticatedState extends AuthenticationState {}
