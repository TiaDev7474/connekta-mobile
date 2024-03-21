part of 'credential_bloc.dart';

@immutable
abstract class CredentialEvent {}
class SignUpSubmitEvent extends CredentialEvent{
  final String email;
  final String password;
  SignUpSubmitEvent({required this.email, required this.password});
}

class SignInSubmitEvent extends CredentialEvent{
  final String email;
  final String password;
  SignInSubmitEvent({required this.email, required this.password});
}
class SignOutSubmitEvent extends CredentialEvent{}

class ForgotPasswordEvent extends CredentialEvent {
  final String email;
  ForgotPasswordEvent({required this.email});
}
class SentVerificationEmailEvent extends CredentialEvent {}
class VerificationRequestedEvent extends CredentialEvent {}
class VerificationStreamRequestedEvent extends CredentialEvent {}