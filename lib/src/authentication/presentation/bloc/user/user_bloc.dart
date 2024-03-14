import 'package:bloc/bloc.dart';
import 'package:connekta/src/authentication/domain/model/user.dart';
import 'package:connekta/src/authentication/domain/repository/authentication_repository.dart';
import 'package:meta/meta.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthenticationRepository authenticationRepository;
  UserBloc({required this.authenticationRepository}) : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetUserEvent>((event, emit) async {
       try{
          emit(UserLoading());
          final uid = await  authenticationRepository.getCurrentUuid();
          final user = await authenticationRepository.getSingleUser(uid).first;
          emit(UserLoaded(user: user));
       }catch (e){
         emit(UserFailure());
       }
    });
  }
}
