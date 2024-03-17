import 'package:connekta/src/authentication/presentation/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAvatar extends StatefulWidget {
  final String userid;
  const UserAvatar({super.key, required this.userid});

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}


class _UserAvatarState extends State<UserAvatar> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetUserEvent(id: widget.userid));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
         if(state is UserLoaded){
            return Text(state.user.displayName);
         }
         if(state is UserLoading){
            return const CircularProgressIndicator();
         }
         return Container(
           width: 20,
           height: 20,
           color: Colors.white54,
         );

      },

    );
  }
}
