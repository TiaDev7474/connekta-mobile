import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connekta/src/authentication/domain/repository/authentication_repository.dart';
import 'package:meta/meta.dart';
part 'credential_event.dart';
part 'credential_state.dart';

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {
  final AuthenticationRepository authenticationRepository;
  CredentialBloc({required this.authenticationRepository}) : super(CredentialInitial()) {
    on<CredentialEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignUpSubmitEvent>((event, emit) async {
       try{
          emit(CredentialLoading());
          await authenticationRepository.signUpWithPasswordAndEmail(event.email, event.password);
          emit(CredentialSuccess());
       }catch(e) {
         //todo: handle exception
         emit(CredentialFailure());
       }
    });
  }
}
