part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.theStates = TheStates.initial,
    this.errorMessage,
    this.isTypingPassword = false,
    this.user,
  });

  final TheStates theStates;
  final String? errorMessage;
  final bool isTypingPassword;
  final UserrEntity? user;

  LoginState copyWith({
    TheStates? theStates,
    String errorMessage = 'Error',
    bool? isTypingPassword,
    UserrEntity? user,
  }) {
    return LoginState(
      theStates: theStates ?? this.theStates,
      errorMessage: errorMessage,
      isTypingPassword: isTypingPassword ?? this.isTypingPassword,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [theStates, errorMessage, isTypingPassword, user];
}
