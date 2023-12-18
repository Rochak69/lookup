part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class GoogleLoginEvent extends LoginEvent {}

class CredentialLoginEvent extends LoginEvent {
  CredentialLoginEvent({required this.email, required this.password});

  final String email;
  final String password;
}

class SignUpWthCredentialEvent extends LoginEvent {
  SignUpWthCredentialEvent({required this.email, required this.password});

  final String email;
  final String password;
}

class PasswordTypingEvent extends LoginEvent {
  PasswordTypingEvent({required this.isTyping});

  final bool isTyping;
}
