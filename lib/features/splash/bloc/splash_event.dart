part of 'splash_bloc.dart';

sealed class SplashEvent {
  const SplashEvent();
}

class CompleteHeightAnimation extends SplashEvent {}

class ShowLoginButton extends SplashEvent {}

class StartLogoChange extends SplashEvent {}

class ChangeLogoColor extends SplashEvent {}
