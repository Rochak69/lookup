part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    this.changeLogoColor = false,
    this.isHeightAnimationComplete = false,
    this.logo = AppImages.lookupWhite,
    this.showLogin = false,
  });
  final bool isHeightAnimationComplete;
  final String logo;
  final bool showLogin;
  final bool changeLogoColor;

  @override
  List<Object?> get props =>
      [isHeightAnimationComplete, logo, showLogin, changeLogoColor];

  SplashState copyWith({
    bool? isHeightAnimationComplete,
    String? logo,
    bool? showLogin,
    bool? changeLogoColor,
  }) {
    return SplashState(
      isHeightAnimationComplete:
          isHeightAnimationComplete ?? this.isHeightAnimationComplete,
      logo: logo ?? this.logo,
      showLogin: showLogin ?? this.showLogin,
      changeLogoColor: changeLogoColor ?? this.changeLogoColor,
    );
  }
}
