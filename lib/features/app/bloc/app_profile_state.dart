part of 'app_profile_bloc.dart';

class AppProfileState extends Equatable {
  const AppProfileState({
    this.user,
    this.theStates = TheStates.initial,
    this.errorMessage = AppConstants.errorMessage,
  });

  final TheStates theStates;
  final UserrEntity? user;
  final String errorMessage;

  @override
  List<Object?> get props => [theStates, user, errorMessage];

  AppProfileState copyWith({
    TheStates? theStates,
    UserrEntity? user,
    String errorMessage = AppConstants.errorMessage,
  }) {
    return AppProfileState(
      theStates: theStates ?? this.theStates,
      user: user ?? this.user,
      errorMessage: errorMessage,
    );
  }
}
