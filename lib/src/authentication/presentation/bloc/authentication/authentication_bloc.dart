import 'package:bloc/bloc.dart';
import 'package:connekta/src/authentication/domain/repository/authentication_repository.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationBloc({required this.authenticationRepository }) : super(AuthInitialState()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AppStartedEvent>((event, emit) async {
        if(await authenticationRepository.isSignIn()){
           final uid = await authenticationRepository.getCurrentUuid();
           final user = await authenticationRepository.getCurrentUser();
           emit(AuthenticatedState(uid: uid, isEmailVerified: user!.emailVerified, email: user.email));
        }else{
           emit(UnAuthenticatedState());
        }
    });

    on<LoggedInEvent>((event, emit) async {
      String uid = await authenticationRepository.getCurrentUuid();
      final user = await authenticationRepository.getCurrentUser();
      emit(AuthenticatedState(uid: uid));
    });
    on<LoggedOutEvent>((event, emit) async {
      await authenticationRepository.signOut();
      emit(UnAuthenticatedState());
    });
  }
}
