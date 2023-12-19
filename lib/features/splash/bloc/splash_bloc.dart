import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/res/app_images.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashEvent>((event, emit) {});
    on<CompleteHeightAnimation>(_completeHeightAnimation);
    on<ShowLoginButton>(_showLoginButton);
    on<StartLogoChange>(_startLogoChange);
  }

  FutureOr<void> _completeHeightAnimation(
    CompleteHeightAnimation event,
    Emitter<SplashState> emit,
  ) {
    emit(state.copyWith(isHeightAnimationComplete: true));
  }

  FutureOr<void> _showLoginButton(
    ShowLoginButton event,
    Emitter<SplashState> emit,
  ) {
    emit(state.copyWith(showLogin: true));
  }

  FutureOr<void> _startLogoChange(
    StartLogoChange event,
    Emitter<SplashState> emit,
  ) async {
    emit(state.copyWith(logo: AppImages.lookupWhiteEyeOpen));

    await Future<dynamic>.delayed(const Duration(milliseconds: 160));
    emit(state.copyWith(logo: AppImages.lookupWhite));

    await Future<dynamic>.delayed(const Duration(milliseconds: 160));
    emit(state.copyWith(logo: AppImages.lookupWhiteEyeOpen));

    await Future<dynamic>.delayed(const Duration(milliseconds: 160));
    emit(state.copyWith(logo: AppImages.lookupWhite));

    await Future<dynamic>.delayed(const Duration(milliseconds: 160));
    emit(state.copyWith(logo: AppImages.lookupWhiteEyeOpen));

    await Future<dynamic>.delayed(const Duration(milliseconds: 160));
    emit(state.copyWith(logo: AppImages.lookupWhite));

    await Future<dynamic>.delayed(const Duration(milliseconds: 160));
    emit(state.copyWith(logo: AppImages.lookupWhiteEyeOpen));

    await Future<dynamic>.delayed(const Duration(milliseconds: 160));
    emit(state.copyWith(logo: AppImages.lookupWhite));
    await Future<dynamic>.delayed(const Duration(milliseconds: 160));
    emit(state.copyWith(logo: AppImages.lookupWhiteEyeOpen));
  }
}
