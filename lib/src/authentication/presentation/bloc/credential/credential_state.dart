part of 'credential_bloc.dart';

@immutable
abstract class CredentialState {}

class CredentialInitial extends CredentialState {}
class CredentialSuccess extends CredentialState {}
class CredentialFailure extends CredentialState {}
class CredentialLoading extends CredentialState {}
