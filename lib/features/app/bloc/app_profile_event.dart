part of 'app_profile_bloc.dart';

sealed class AppProfileEvent {
  const AppProfileEvent();
}

class AddUserDetails extends AppProfileEvent {
  AddUserDetails({required this.user});

  final UserrEntity? user;
}
