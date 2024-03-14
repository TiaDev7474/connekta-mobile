part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}
class AppStartedEvent extends AuthenticationEvent{}
class LoggedInEvent extends AuthenticationEvent{}
class LoggedOutEvent extends AuthenticationEvent{}