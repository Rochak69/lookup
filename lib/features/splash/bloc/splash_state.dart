// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    this.isHeightAnimationComplete = false,
    this.logo = AppImages.lookupWhite,
    this.showLogin = false,
  });
  final bool isHeightAnimationComplete;
  final String logo;
  final bool showLogin;

  @override
  List<Object?> get props => [isHeightAnimationComplete, logo, showLogin];

  SplashState copyWith({
    bool? isHeightAnimationComplete,
    String? logo,
    bool? showLogin,
  }) {
    return SplashState(
      isHeightAnimationComplete:
          isHeightAnimationComplete ?? this.isHeightAnimationComplete,
      logo: logo ?? this.logo,
      showLogin: showLogin ?? this.showLogin,
    );
  }
}
