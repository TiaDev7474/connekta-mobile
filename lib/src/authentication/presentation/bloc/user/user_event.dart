part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUserEvent extends UserEvent{
  final String id;
  GetUserEvent({required this.id});
}