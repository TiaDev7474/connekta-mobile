import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connekta/src/authentication/domain/repository/authentication_repository.dart';
import 'package:connekta/src/core/utils/timer.dart';
import 'package:meta/meta.dart';
part 'credential_event.dart';
part 'credential_state.dart';

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {
  final AuthenticationRepository authenticationRepository;
  late Timer timer;
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
    on<SentVerificationEmailEvent>((event,emit) async {
      try{
        emit(CredentialLoading());
        await  authenticationRepository.sendVerificationEmail();
        final uid = await authenticationRepository.getCurrentUuid();
        emit(CredentialSuccess());
      }catch(e) {
        emit(CredentialFailure());
      }
    });
    on<VerificationRequestedEvent>((event, emit) async {

      try{
        emit(CredentialLoading());
        final user = await authenticationRepository.getCurrentUser();
        await user?.reload();
        if(user!.emailVerified){
          emit(CredentialSuccess());
        }
      }catch (e){
         emit(CredentialFailure());
      }
    });
    on<VerificationStreamRequestedEvent>((event, state) async{
      timer = makePeriodicCall(const Duration(milliseconds: 2500), (Timer t) {
        add(VerificationRequestedEvent());
      }, fireNow: true);
    });
    on<SignInSubmitEvent>((event, emit) async {
      try{
        emit(CredentialLoading());
        await authenticationRepository.signInWithPasswordAndEmail(event.email, event.password);
        emit(CredentialSuccess());
      }catch(e){
        emit(CredentialFailure());
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    timer.cancel();
    print("wait verification email timer is canceled");
    return super.close();
  }
}
